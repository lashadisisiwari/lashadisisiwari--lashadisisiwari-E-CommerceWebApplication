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