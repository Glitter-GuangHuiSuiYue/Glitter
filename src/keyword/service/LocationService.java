package keyword.service;

import java.util.List;

import keyword.bean.Location;
import keyword.dao.LocationDao;


public class LocationService {
	private LocationDao dao;

	public LocationDao getDao() {
		return dao;
	}

	public void setDao(LocationDao dao) {
		this.dao = dao;
	}
	
	public LocationService(){
	}

	public Long createLocation(String location){
		Location l=new Location();
		l.setLocation(location);
		return dao.insert(l);
	}

	public Long createLocation(String location, String country, String state, String city, String district, String street){
		Location l=new Location();
		l.setLocation(location);
		l.setCountry(country);
		l.setState(state);
		l.setCity(city);
		l.setDistrict(district);
		l.setStreet(street);
		return dao.insert(l);
	}

	public Long createLocation(String location, Float lagtitute, Float longtitute){
		Location l=new Location();
		l.setLocation(location);
		l.setLagtitute(lagtitute);
		l.setLongtitute(longtitute);
		return dao.insert(l);
	}

	public Long insert(Location l){
		Long id = dao.insert(l);
		return id;
	}

	public boolean update(Location l){
		return dao.update(l);
	}

	/*public List<Keyword> selectAllKeywordsByUID(long uid){
		return dao.selects("from Keyword k where k.id="+uid);
	}*/

	public List<Location> selectLocationByID(long id){
		return dao.selects("from Location l where l.id=" + id);
	}

	public Location selectLocationByName(String location){
		List<Location> list = dao.selects("from Location l where l.location='" + location + "'");
		if (list == null || list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	public List<Location> selectLocationContainsWord(String loc){
		String sql = "from Location l ";
		if (!loc.equals("Please enter location")){
			sql += "where l.location like '%" + loc + "%'";
		}
		List<Location> list = dao.selects(sql);
		return list;
	}
}
