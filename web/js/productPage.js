const baseUrl = "http://localhost:8080/E_CommerceWebApplication_war_exploded";

// Add event listener for search input
document.getElementById('search').addEventListener('input', function () {
    const searchQuery = this.value.toLowerCase();
    fetchProducts('', searchQuery);
});

document.getElementById('sort').addEventListener('change', function () {
    const sortOrder = this.value;
    fetchProducts(sortOrder);
});

async function fetchProducts(sortOrder = '', searchQuery = '') {
    try {
        const response = await fetch(baseUrl + '/product');
        const defaultImage = 'fashion.png';
        if (response.ok) {
            let fetchedProducts = await response.json();
            const formattedProducts = fetchedProducts.map(product => ({
                id: product.id,
                name: product.name,
                price: product.price,
                image: defaultImage,
                description: product.description,
                category: product.category.category_name,
            }));

            if (sortOrder === 'asc') {
                formattedProducts.sort((a, b) => a.price - b.price);
            } else if (sortOrder === 'desc') {
                formattedProducts.sort((a, b) => b.price - a.price);
            }

            const filteredProducts = formattedProducts.filter(product =>
                product.name.toLowerCase().includes(searchQuery) ||
                product.description.toLowerCase().includes(searchQuery) ||
                product.category.toLowerCase().includes(searchQuery)
            );

            renderProducts(filteredProducts);
        } else {
            console.error("Failed to fetch products");
        }
    } catch (error) {
        console.error("Error fetching products: ", error);
    }
}

function renderProducts(filteredProducts) {
    const productList = document.getElementById('product-list');
    productList.innerHTML = '';

    filteredProducts.forEach(product => {
        const productCard = `
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="${product.image}" class="card-img-top" alt="${product.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">$${product.price.toFixed(2)}</p>
                        <p class="card-text text-muted">${product.description}</p>
                        <p class="card-text"><strong>Category:</strong> ${product.category}</p>
                        <button class="btn btn-primary btn-add-to-cart"
                            data-product-id="${product.id}"
                            data-product-name="${product.name}"
                            data-product-price="${product.price}">
                            Add to Cart
                        </button>
                    </div>
                </div>
            </div>
        `;
        productList.innerHTML += productCard;
    });
}

document.addEventListener('click', function (event) {
    if (event.target && event.target.classList.contains('btn-add-to-cart')) {
        const productId = event.target.getAttribute('data-product-id');
        const productName = event.target.getAttribute('data-product-name');
        const productPrice = parseFloat(event.target.getAttribute('data-product-price'));
        const quantity = 1;

        const userId = sessionStorage.getItem('id');
        if (userId!=null){
            addToCart(userId, productId, quantity, productPrice);
        }else {
            alert("Create And Login Your Account")
        }
    }
});

async function addToCart(userId, productId, quantity, price) {
    const data = {
        user_id: userId,
        product_id: productId,
        quantity: quantity,
        price: price
    };

    try {
        const response = await fetch(baseUrl + '/cart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        if (response.ok) {
            const result = await response.json();
            alert(result.message);
        } else {
            const result = await response.json();
            alert(result.error);
        }
    } catch (error) {
        console.error('Error adding product to cart:', error);
        alert('Error adding product to cart');
    }
}

fetchProducts();