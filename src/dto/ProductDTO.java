package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString

public class ProductDTO {
    private int id;
    private String name;
    private int category;
    private double price;
    private String description;

    public ProductDTO(String name, String category, double price, String description) {
        this.name = name;
        this.category = Integer.parseInt(category);
        this.price = price;
        this.description = description;
    }

    public ProductDTO(int id, String name, String category, double price, String description) {
        this.id = id;
        this.name = name;
        this.category = Integer.parseInt(category);
        this.price = price;
        this.description = description;
    }
}
