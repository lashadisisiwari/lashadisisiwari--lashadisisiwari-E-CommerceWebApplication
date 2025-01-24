package dto.get;

import dto.CategoryDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class ProductGetDTO {
    private int id;
    private String name;
    private CategoryDTO category;
    private double price;
    private String description;
}
