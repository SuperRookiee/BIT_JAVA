package beans;

public class Products {
	private String proId;
	private String proName;
	private Integer unitPrice;
	private String description;
	private String manufacturer;
	private String category;
	private Integer noOfStock;
	private String filename;
	private Integer quantity;
	
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Products() {
		
	}

	public Products(String proId, String proName, Integer unitPrice, String description, String manufacturer,
			String category, Integer noOfStock, String filename) {
		super();
		this.proId = proId;
		this.proName = proName;
		this.unitPrice = unitPrice;
		this.description = description;
		this.manufacturer = manufacturer;
		this.category = category;
		this.noOfStock = noOfStock;
		this.filename = filename;
	}



	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getNoOfStock() {
		return noOfStock;
	}

	public void setNoOfStock(Integer noOfStock) {
		this.noOfStock = noOfStock;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
