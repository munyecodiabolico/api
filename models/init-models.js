var DataTypes = require("sequelize").DataTypes;
var _Business = require("./business");
var _CartDetail = require("./cart-detail");
var _Contact = require("./contact");
var _Customer = require("./customer");
var _Fingerprint = require("./fingerprint");
var _ImageConfiguration = require("./image-configuration");
var _Language = require("./language");
var _Locale = require("./locale");
var _PaymentMethod = require("./payment-method");
var _ProductCategory = require("./product-category");
var _Product = require("./product");
var _RefundDetail = require("./refund-detail");
var _Refund = require("./refund");
var _ResizedImage = require("./resized-image");
var _SaleDetail = require("./sale-detail");
var _SaleError = require("./sale-error");
var _Sale = require("./sale");
var _ShoppingCart = require("./shopping-cart");
var _Slider = require("./slider");
var _SourceImage = require("./source-image");
var _Tax = require("./tax");

function initModels(sequelize) {
    var Business = _Business(sequelize, DataTypes);
    var CartDetail = _CartDetail(sequelize, DataTypes);
    var Contact = _Contact(sequelize, DataTypes);
    var Customer = _Customer(sequelize, DataTypes);
    var Fingerprint = _Fingerprint(sequelize, DataTypes);
    var ImageConfiguration = _ImageConfiguration(sequelize, DataTypes);
    var Language = _Language(sequelize, DataTypes);
    var Locale = _Locale(sequelize, DataTypes);
    var PaymentMethod = _PaymentMethod(sequelize, DataTypes);
    var ProductCategory = _ProductCategory(sequelize, DataTypes);
    var Product = _Product(sequelize, DataTypes);
    var RefundDetail = _RefundDetail(sequelize, DataTypes);
    var Refund = _Refund(sequelize, DataTypes);
    var ResizedImage = _ResizedImage(sequelize, DataTypes);
    var SaleDetail = _SaleDetail(sequelize, DataTypes);
    var SaleError = _SaleError(sequelize, DataTypes);
    var Sale = _Sale(sequelize, DataTypes);
    var ShoppingCart = _ShoppingCart(sequelize, DataTypes);
    var Slider = _Slider(sequelize, DataTypes);
    var SourceImage = _SourceImage(sequelize, DataTypes);
    var Tax = _Tax(sequelize, DataTypes);

    Fingerprint.belongsTo(Customer, { as: "customer", foreignKey: "customerId"});
    Customer.hasMany(Fingerprint, { as: "fingerprints", foreignKey: "customerId"});
    Refund.belongsTo(Customer, { as: "customer", foreignKey: "customersId"});
    Customer.hasMany(Refund, { as: "refunds", foreignKey: "customersId"});
    SaleError.belongsTo(Customer, { as: "customer", foreignKey: "customersId"});
    Customer.hasMany(SaleError, { as: "sale_errors", foreignKey: "customersId"});
    Sale.belongsTo(Customer, { as: "customer", foreignKey: "customersId"});
    Customer.hasMany(Sale, { as: "sales", foreignKey: "customersId"});
    ShoppingCart.belongsTo(Customer, { as: "customer", foreignKey: "customersId"});
    Customer.hasMany(ShoppingCart, { as: "shopping_carts", foreignKey: "customersId"});
    Contact.belongsTo(Fingerprint, { as: "fingerprint", foreignKey: "fingerprintsId"});
    Fingerprint.hasMany(Contact, { as: "contacts", foreignKey: "fingerprintsId"});
    ShoppingCart.belongsTo(Fingerprint, { as: "fingerprint", foreignKey: "fingerprintsId"});
    Fingerprint.hasMany(ShoppingCart, { as: "shopping_carts", foreignKey: "fingerprintsId"});
    ResizedImage.belongsTo(ImageConfiguration, { as: "imageConfiguration", foreignKey: "imageConfigurationsId"});
    ImageConfiguration.hasMany(ResizedImage, { as: "resized_images", foreignKey: "imageConfigurationsId"});
    Refund.belongsTo(PaymentMethod, { as: "paymentMethod", foreignKey: "paymentMethodsId"});
    PaymentMethod.hasMany(Refund, { as: "refunds", foreignKey: "paymentMethodsId"});
    SaleError.belongsTo(PaymentMethod, { as: "paymentMethod", foreignKey: "paymentMethodsId"});
    PaymentMethod.hasMany(SaleError, { as: "sale_errors", foreignKey: "paymentMethodsId"});
    Sale.belongsTo(PaymentMethod, { as: "paymentMethod", foreignKey: "paymentMethodsId"});
    PaymentMethod.hasMany(Sale, { as: "sales", foreignKey: "paymentMethodsId"});
    Product.belongsTo(ProductCategory, { as: "productCategory", foreignKey: "productCategoriesId"});
    ProductCategory.hasMany(Product, { as: "products", foreignKey: "productCategoriesId"});
    CartDetail.belongsTo(Product, { as: "product", foreignKey: "productsId"});
    Product.hasMany(CartDetail, { as: "cart_details", foreignKey: "productsId"});
    RefundDetail.belongsTo(Product, { as: "product", foreignKey: "productsId"});
    Product.hasMany(RefundDetail, { as: "refund_details", foreignKey: "productsId"});
    SaleDetail.belongsTo(Product, { as: "product", foreignKey: "productsId"});
    Product.hasMany(SaleDetail, { as: "sale_details", foreignKey: "productsId"});
    RefundDetail.belongsTo(Refund, { as: "refund", foreignKey: "refundsId"});
    Refund.hasMany(RefundDetail, { as: "refund_details", foreignKey: "refundsId"});
    SaleDetail.belongsTo(Sale, { as: "sale", foreignKey: "salesId"});
    Sale.hasMany(SaleDetail, { as: "sale_details", foreignKey: "salesId"});
    CartDetail.belongsTo(ShoppingCart, { as: "shoppingCart", foreignKey: "shoppingCartsId"});
    ShoppingCart.hasMany(CartDetail, { as: "cart_details", foreignKey: "shoppingCartsId"});
    Refund.belongsTo(ShoppingCart, { as: "shoppingCart", foreignKey: "shoppingCartsId"});
    ShoppingCart.hasMany(Refund, { as: "refunds", foreignKey: "shoppingCartsId"});
    SaleError.belongsTo(ShoppingCart, { as: "shoppingCart", foreignKey: "shoppingCartsId"});
    ShoppingCart.hasMany(SaleError, { as: "sale_errors", foreignKey: "shoppingCartsId"});
    Sale.belongsTo(ShoppingCart, { as: "shoppingCart", foreignKey: "shoppingCartsId"});
    ShoppingCart.hasMany(Sale, { as: "sales", foreignKey: "shoppingCartsId"});
    ResizedImage.belongsTo(SourceImage, { as: "sourceImage", foreignKey: "sourceImagesId"});
    SourceImage.hasMany(ResizedImage, { as: "resized_images", foreignKey: "sourceImagesId"});
    Product.belongsTo(Tax, { as: "tax", foreignKey: "taxesId"});
    Tax.hasMany(Product, { as: "products", foreignKey: "taxesId"});

    return {
        Business,
        CartDetail,
        Contact,
        Customer,
        Fingerprint,
        ImageConfiguration,
        Language,
        Locale,
        PaymentMethod,
        ProductCategory,
        Product,
        RefundDetail,
        Refund,
        ResizedImage,
        SaleDetail,
        SaleError,
        Sale,
        ShoppingCart,
        Slider,
        SourceImage,
        Tax,
    };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
