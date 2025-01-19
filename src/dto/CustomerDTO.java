package dto;

public class CustomerDTO {
    private String id;
    private String name;
    private String address;

    // Default Constructor (Optional, if required elsewhere)
    public CustomerDTO() {
    }

    // Parameterized Constructor
    public CustomerDTO(String id, String name, String address) {
        this.id = id;
        this.name = name;
        this.address = address;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
