// Array of products
const products = [
    { name: "Product 1", price: 25.00, image: "accest/image1.jpg" },
    { name: "Product 2", price: 35.00, image: "accest/image2.jpg" },
    { name: "Product 3", price: 45.00, image: "accest/image3.jpg" },
    { name: "Product 4", price: 55.00, image: "accest/image4.jpg" },
    { name: "Product 2", price: 35.00, image: "accest/image5.jpg" },
    { name: "Product 3", price: 45.00, image: "accest/image6.jpg" },
    { name: "Product 4", price: 55.00, image: "accest/image7.jpg" },
    { name: "Product 2", price: 35.00, image: "accest/image8.jpg" },
    { name: "Product 3", price: 45.00, image: "accest/image9.jpg" },
    { name: "Product 4", price: 55.00, image: "accest/image10.jpg" },
    { name: "Product 2", price: 35.00, image: "accest/image11.jpg" },
    { name: "Product 3", price: 45.00, image: "accest/image12.jpg" },
    { name: "Product 4", price: 55.00, image: "accest/image13.jpg" }
];

const featuredProductsContainer = document.getElementById("featured-products");

// Generate product cards dynamically
products.forEach(product => {
    const productCard = `
      <div class="col-md-3 mb-3"">
        <div class="card product-card"  id="imageTab">
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