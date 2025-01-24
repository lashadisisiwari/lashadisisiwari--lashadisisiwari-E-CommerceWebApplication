let products = [];
let editingIndex = -1;
const  baseUrl="http://localhost:8080/E_CommerceWebApplication_war_exploded";
async function fetchCategories() {
    try {
        const response = await fetch(baseUrl+'/category');
        if (response.ok) {
            const categories = await response.json();
            renderCategories(categories);
        } else {
            console.error("Failed to fetch categories");
        }
    } catch (error) {
        console.error("Error fetching categories: ", error);
    }
}

function renderCategories(categories) {
    const categorySelect = document.getElementById('productCategory');
    categorySelect.innerHTML = '<option value="" disabled selected>Select a category</option>';
    categories.forEach((category) => {
        const option = document.createElement('option');
        option.value = category.category_id;
        option.textContent = category.category_name;
        categorySelect.appendChild(option);
    });
}

async function fetchProducts() {
    try {
        const response = await fetch(baseUrl+'/product');
        if (response.ok) {
            products = await response.json();
            renderProducts(products);
        } else {
            console.error("Failed to fetch products");
        }
    } catch (error) {
        console.error("Error fetching products: ", error);
    }
}

function renderProducts(products) {
    const tableBody = document.getElementById('productTableBody');
    tableBody.innerHTML = '';
    products.forEach((product, index) => {
        const row = `
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.category.category_name}</td>
                        <td>$${product.price}</td>
                        <td>${product.description}</td>
                        <td>
                            <button class="btn btn-warning btn-sm" onclick="editProduct(${index})">Edit</button>
                            <button class="btn btn-danger btn-sm" onclick="deleteProduct(${product.id})">Delete</button>
                        </td>
                    </tr>
                `;
        tableBody.innerHTML += row;
    });
}

function editProduct(index) {
    const product = products[index];
    document.getElementById('productName').value = product.name;
    document.getElementById('productCategory').value = product.category.category_id;
    document.getElementById('productPrice').value = product.price;
    document.getElementById('productDescription').value = product.description;
    editingIndex = index;
    document.querySelector('button[type="submit"]').textContent = 'Update Product';
}

async function deleteProduct(productId) {
    try {
        const response = await fetch(baseUrl+`/product?product_id=${productId}`, {
            method: 'DELETE',
        });
        if (response.ok) {
            alert('Product deleted successfully!');
            fetchProducts();
        } else {
            console.error('Failed to delete product');
        }
    } catch (error) {
        console.error("Error deleting product: ", error);
    }
}

document.getElementById('productForm').addEventListener('submit', async function(event) {
    event.preventDefault();

    const name = document.getElementById('productName').value;
    const category = document.getElementById('productCategory').value;
    const price = parseFloat(document.getElementById('productPrice').value);
    const description = document.getElementById('productDescription').value;

    const productData = { name, category, price, description };

    if (editingIndex === -1) {
        try {
            const response = await fetch(baseUrl+'/product', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(productData)
            });
            if (response.ok) {
                alert('Product added successfully!');
                fetchProducts();
                resetForm();
            } else {
                console.error("Failed to add product");
            }
        } catch (error) {
            console.error("Error adding product: ", error);
        }
    } else {
        const productId = products[editingIndex].id;
        try {
            const response = await fetch(baseUrl+`/product?id=${productId}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(productData)
            });
            if (response.ok) {
                alert('Product updated successfully!');
                fetchProducts();
                resetForm();
            } else {
                console.error("Failed to update product");
            }
        } catch (error) {
            console.error("Error updating product: ", error);
        }
        editingIndex = -1;
        document.querySelector('button[type="submit"]').textContent = 'Add Product';
    }
});

function resetForm() {
    document.getElementById('productForm').reset();
    document.querySelector('button[type="submit"]').textContent = 'Add Product';
}

window.onload = function() {
    fetchCategories();
    fetchProducts();
};