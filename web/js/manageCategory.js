const apiUrl = 'http://localhost:8080/E_CommerceWebApplication_war_exploded/category';
let categories = [];
let editCategoryId = null; // To store the category ID being edited

// Function to fetch categories
async function fetchCategories() {
    try {
        const response = await fetch(apiUrl);
        if (response.ok) {
            const data = await response.json();
            categories = data;
            populateTable();
        } else {
            alert('Failed to fetch categories.');
        }
    } catch (error) {
        console.error('Error fetching categories:', error);
    }
}

// Function to populate categories in table
function populateTable() {
    const tableBody = document.getElementById("categoryTableBody");
    tableBody.innerHTML = "";

    categories.forEach(category => {
        const row = `
                <tr>
                    <td>${category.category_id}</td>
                    <td>${category.category_name}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editCategory('${category.category_id}')">Edit</button>
                        <button class="btn btn-danger btn-sm" onclick="deleteCategory('${category.category_id}')">Delete</button>
                    </td>
                </tr>
            `;
        tableBody.innerHTML += row;
    });
}

// Function to add a new category
document.getElementById("saveCategoryBtn").addEventListener("click", async () => {
    const categoryName = document.getElementById("categoryName").value.trim();

    if (categoryName) {
        const newCategory = {
            category_name: categoryName
        };

        try {
            const response = await fetch(apiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(newCategory)
            });

            if (response.ok) {
                alert("Category added successfully!");
                fetchCategories();  // Refresh the categories
                document.getElementById("addCategoryForm").reset();
                const modal = bootstrap.Modal.getInstance(document.getElementById("addCategoryModal"));
                modal.hide();
            } else {
                alert("Failed to add category.");
            }
        } catch (error) {
            console.error('Error adding category:', error);
        }
    } else {
        alert("Please enter a valid category name.");
    }
});

// Function to edit category
function editCategory(categoryId) {
    const category = categories.find(cat => cat.category_id === categoryId);
    if (category) {
        document.getElementById("categoryName").value = category.category_name;
        // Change modal title and show update button
        document.getElementById("addCategoryModalLabel").innerText = 'Edit Category';
        document.getElementById("saveCategoryBtn").style.display = 'none';
        document.getElementById("updateCategoryBtn").style.display = 'inline-block';
        editCategoryId = categoryId; // Store the category ID for updating
        const modal = new bootstrap.Modal(document.getElementById('addCategoryModal'));
        modal.show();
    }
}

// Function to update category
document.getElementById("updateCategoryBtn").addEventListener("click", async () => {
    const categoryName = document.getElementById("categoryName").value.trim();

    if (categoryName && editCategoryId) {
        const updatedCategory = {
            category_name: categoryName
        };

        try {
            const response = await fetch(`${apiUrl}?category_id=${editCategoryId}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(updatedCategory)
            });

            if (response.ok) {
                alert("Category updated successfully!");
                fetchCategories();  // Refresh the categories
                document.getElementById("addCategoryForm").reset();
                const modal = bootstrap.Modal.getInstance(document.getElementById("addCategoryModal"));
                modal.hide();
            } else {
                alert("Failed to update category.");
            }
        } catch (error) {
            console.error('Error updating category:', error);
        }
    } else {
        alert("Please enter a valid category name.");
    }
});

// Function to delete category
async function deleteCategory(categoryId) {
    try {
        const response = await fetch(`${apiUrl}?category_id=${categoryId}`, {
            method: 'DELETE'
        });

        if (response.ok) {
            alert("Category deleted successfully!");
            fetchCategories();  // Refresh the categories
        } else {
            alert("Failed to delete category.");
        }
    } catch (error) {
        console.error('Error deleting category:', error);
    }
}

// Initial fetch when the page loads
fetchCategories();