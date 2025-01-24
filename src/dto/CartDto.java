package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class CartDto {
    private int id;
    private int userId;
    private int productId;
    private int quantity;
    private double price;
}
