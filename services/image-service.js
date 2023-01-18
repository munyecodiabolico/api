const fs = require('fs');
const path = require('path');
const sharp = require('sharp');
const db = require("../models");
const SourceImage = db.SourceImage;
const ImageConfiguration = db.ImageConfiguration;
const ResizedImage = db.ResizedImage;


// Esta línea establece esta clase como un módulo exportable, lo que significa que puede ser importado en otros archivos de Node.js.
module.exports = class ImageService {
    // El constructor es una función especial que se ejecuta automáticamente cuando se instancia una nueva clase.
    // En este caso, toma dos parámetros: "entidad" y "entidadId"
    constructor(entity, entityId) {
        this.entity = entity;
        this.entityId = entityId;
    }

    // Este es el método "uploadImage" de la clase. El método recibe un parámetro llamado "images".
    uploadImage = images => {
        // Este es un ciclo for in que recorre cada una de las propiedades de "images"
        for (let key in images) {
            // Este es un ciclo forEach que recorre cada uno de los elementos de la propiedad actual de "images"
            images[key].forEach(image => {
                // Este es una condicional que verifica si el nombre del campo incluye "[]"
                if(image.fieldname.includes('[]')){
                    // Si se cumple la condición anterior, se remplaza "[]" con ""
                    image.fieldname = image.fieldname.replace('[]', '');
                }
                // Establece una variable "oldPath" con la ruta temporal de la imagen actual
                let oldPath = path.join(__dirname, `../storage/tmp/${image.originalname}`);
                // Establece una variable "newPath" con la ruta de destino de la imagen actual
                let newPath = path.join(__dirname, `../storage/images/${this.entity}/${this.entityId}/${image.fieldname}/original/${image.originalname}`);   
                // Establece una variable "newDir" con el directorio de la ruta de destino
                let newDir = path.dirname(newPath);

                // Crea el directorio especificado en "newDir" utilizando el módulo 'fs', con la opción "recursive" que permite crear todos los directorios necesarios de manera recursiva. Si ocurre algún error, se ejecuta la función de callback con el parámetro "err"
                fs.mkdir(newDir, { recursive: true }, (err) => {
                    // Si se produjo un error en la creación del directorio, se lanza una excepción
                    if (err) throw err;
                    // Mueve la imagen desde la ruta temporal (oldPath) a la ruta de destino (newPath) utilizando el módulo 'fs', si ocurre algún error, se ejecuta la función de callback con el parámetro "err"
                    fs.rename(oldPath, newPath, (err) => {
                        // Si se produjo un error al mover la imagen, se lanza una excepción
                        if (err) throw err;
                    });

                    // usamos sharp para obtener el width y el height de la imagen y luego ya podemos crear el registro
                    sharp(newPath)
                    .metadata()
                    .then(metadata => {
                        return SourceImage.create(
                            {
                               path:  `/storage/images/${this.entity}/${this.entityId}/${image.fieldname}/original/${image.originalname}`,
                               entity: this.entity,
                               entityKey : this.entityId,
                               filename: image.originalname,
                               languageAlias: "es",
                               content: image.fieldname,
                               mimeType: image.mimetype,
                               sizeBytes: image.size,
                               widthPx: metadata.width,
                               heightPx: metadata.height
                            });

                    }).then (sourceImage => {
                        // Verifica si el directorio "thumbnail" no existe en la ruta de destino
                        if (!fs.existsSync(path.join(__dirname,  `../storage/images/${this.entity}/${this.entityId}/${image.fieldname}/thumbnail`))){
                            // Crea el directorio "thumbnail" en la ruta de destino
                            fs.mkdirSync(path.join(__dirname,  `../storage/images/${this.entity}/${this.entityId}/${image.fieldname}/thumbnail`));	
                        }
                        // Verifica si el directorio "mobile" no existe en la ruta de destino
                        if (!fs.existsSync(path.join(__dirname,  `../storage/images/${this.entity}/${this.entityId}/${image.fieldname}/mobile`))){
                            // Crea el directorio "mobile" en la ruta de destino
                            fs.mkdirSync(path.join(__dirname,  `../storage/images/${this.entity}/${this.entityId}/${image.fieldname}/mobile`));	
                        }
                        // Verifica si el directorio "desktop" no existe en la ruta de destino
                        if (!fs.existsSync(path.join(__dirname,  `../storage/images/${this.entity}/${this.entityId}/${image.fieldname}/desktop`))){
                            // Crea el directorio "desktop" en la ruta de destino
                            fs.mkdirSync(path.join(__dirname,  `../storage/images/${this.entity}/${this.entityId}/${image.fieldname}/desktop`));	
                        }
                        
                        ImageConfiguration.findAll({
                            where: {
                                entity: this.entity,
                                content: image.fieldname
                            }
                        }).then(datosObtenidos =>{
                            for (let item of datosObtenidos) {
                                // Utiliza la librería 'sharp' para redimensionar la imagen en la ruta de destino
                                sharp(newPath)
                                // Redimensiona la imagen a 200x200 pixels
                                .resize(item.widthPx, item.heightPx)
                                // Convierte la imagen a formato webp
                                .toFormat(item.extensionConversion)
                                // Guarda la imagen redimensionada en el directorio "thumbnail" de la ruta de destino
                                .toFile(path.join(__dirname, `../storage/images/${this.entity}/${this.entityId}/${image.fieldname}/${item.grid}/${path.parse(image.filename).name}.webp`)) 
                                // Si la redimensionada y conversión se realizó correctamente
                                .then(resizedImage  => { // el campo resizedImage es el contenedor de la informacion pero puede ser lo que uno quiera
    
                                    ResizedImage.create(
                                        {
                                            sourceImagesId: sourceImage.id,
                                            imageConfigurationsId: item.id,
                                            titleText: "Hola",
                                            altText: "Hola",
                                            path: `/storage/images/${this.entity}/${this.entityId}/${image.fieldname}/${item.grid}/${path.parse(image.filename).name}.webp`,
                                            entity: this.entity,
                                            entityKey : this.entityId,
                                            languageAlias: "es",
                                            filename: image.originalname,
                                            content: image.fieldname,
                                            mimeType: image.mimetype,
                                            grid: item.grid,
                                            sizeBytes: resizedImage.size,
                                            widthPx: resizedImage.width,
                                            heightPx: resizedImage.height,
                                            quality: item.quality
                                        });
                                    
                                })
                                // Si ocurrió algún error en la redimensionada o conversión
                                .catch((err) => {
                                    // Muestra el error en consola   
                                    console.log(err);   
                                });
                              }
                        }).catch((err) => {
                            // Muestra el error en consola   
                            console.log(err);   
                        });
                    }).catch((err) => {
                        // Muestra el error en consola   
                        console.log(err);   
                    });
                });
            });
        }
    }
}