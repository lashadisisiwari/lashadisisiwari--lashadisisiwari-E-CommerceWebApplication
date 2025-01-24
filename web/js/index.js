// Array of products
const products = [
    { name: "Product 1", price: 25.00, image: "fashion.png" },
    { name: "Product 2", price: 35.00, image: "fashion.png" },
    { name: "Product 3", price: 45.00, image: "fashion.png" },
    { name: "Product 4", price: 55.00, image: "fashion.png" },
    { name: "Product 2", price: 35.00, image: "fashion.png" },
    { name: "Product 3", price: 45.00, image: "fashion.png" },
    { name: "Product 4", price: 55.00, image: "fashion.png" }
];

const featuredProductsContainer = document.getElementById("featured-products");

// Generate product cards dynamically
products.forEach(product => {
    const productCard = `
      <div class="col-md-3 mb-3">
        <div class="card product-card">
          <img src="${product.image}" class="card-img-top" alt="${product.name}">
          <div class="card-body">
            <h5 class="card-title">${product.name}</h5>
            <p class="card-text">$${product.price.toFixed(2)}</p>
            <a href="#" class="btn btn-primary">Add to Cart</a>
          </div>
        </div>
      </div>
    `;
    featuredProductsContainer.innerHTML += productCard;
});