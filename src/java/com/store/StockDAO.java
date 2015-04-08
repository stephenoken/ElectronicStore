package com.store;

import java.util.List;

public interface StockDAO {
	public Object search();
	public Object execute();
	public List<Stock> findByTitle(String criteria);
	public List<Stock> findByManufacture(String criteria);
	public List<Stock> findByCategory(String criteria);
}
