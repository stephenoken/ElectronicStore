package com.store;

import java.util.List;

public interface StockDAO {
	public List<Stock> findByTitle();
	public List<Stock> findByManufacture();
	public List<Stock> findByCategory();
}
