package model;

public class Product {
	private int productId;
	
	private String name;
	private int price;
	private String processor;
	private String ram;
	private String storage;
	private String display;
	private String graphic;
	private int stock;
	private String category;
	private byte[] imageUrlFromPart;
	
	public Product() {
		
	}

	

	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public int getProductId() {
		return productId;
	}



	public void setProductId(int productId) {
		this.productId = productId;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProcessor() {
		return processor;
	}

	public void setProcessor(String processor) {
		this.processor = processor;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getStorage() {
		return storage;
	}

	public void setStorage(String storage) {
		this.storage = storage;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getGraphic() {
		return graphic;
	}

	public void setGraphic(String graphic) {
		this.graphic = graphic;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public byte[] getImageUrlFromPart() {
		return imageUrlFromPart;
	}

	public void setImageUrlFromPart(byte[] imageUrlFromPart) {
		this.imageUrlFromPart = imageUrlFromPart;
	}
}
