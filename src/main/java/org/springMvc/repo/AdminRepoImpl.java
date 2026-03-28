package org.springMvc.repo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springMvc.model.City;
import org.springMvc.model.Inquiry;
import org.springMvc.model.Location;
import org.springMvc.model.Property;
import org.springMvc.model.PropertyDisplay;
import org.springMvc.model.State;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class AdminRepoImpl implements AdminRepo {

	@Autowired
	JdbcTemplate jdbc;
	
	//inquery
	public int saveInquiry(Inquiry inquiry) {
        String sql = "insert into inquiry(name, email, message) values (?, ?, ?)";
        return jdbc.update(sql,
                inquiry.getName(),
                inquiry.getEmail(),
                inquiry.getMessage()
        );
    }
	
	public boolean existsByStatename(String statename) {
		String sql = "select count(*) from state where statename = ?";
        Integer count = jdbc.queryForObject(sql, Integer.class, statename);
        return count != null && count > 0;
	}

	@Override
	public int saveState(State state) {
		 return jdbc.update(
			        "insert into state(statecode,statename) values(?,?)",
			        state.getStatecode(),
			        state.getStatename()
			    );
	}
	
	public List<State> getStates()
	{
	return jdbc.query("select * from state",(rs,i)->{

	State s=new State();

	s.setStatecode(rs.getInt("statecode"));
	s.setStatename(rs.getString("statename"));

	return s;

	});
	}
	
	
	public List<City> getCities(int statecode){

		String sql="select * from city where statecode=?";

		return jdbc.query(sql,new BeanPropertyRowMapper<>(City.class),statecode);

		}

		public void addCity(City c){

		String sql="insert into city(name,statecode) values(?,?)";

		jdbc.update(sql,c.getName(),c.getStatecode());
		}

		@Override
		public void addLocation(String locationname,int cid){
			String sql="insert into location(locationname,cid) values(?,?)";
			jdbc.update(sql,locationname,cid);
			}
		@Override
		public void saveLocation(Location loc) {
			
			String sql="insert into location(locationname,cid) values(?,?)";
			jdbc.update(sql,
			loc.getLocationname(),
			loc.getCid()
			);
			 System.out.println("CID = "+loc.getCid());
			 System.out.println("Location = "+loc.getLocationname());
			
		}

		@Override
		public List<Location> getLocations(int cid) {
			String sql="select * from location where cid=?";

			return jdbc.query(sql,new BeanPropertyRowMapper<>(Location.class),cid);

		}

		@Override
		public void saveProperty(Property p) {
			String sql="insert into property(locationcode,area_sqft,bedrooms,bathrooms,parking,metro_distance,price) values(?,?,?,?,?,?,?)";
			jdbc.update(sql,
					p.getLocationcode(),p.getArea_sqft(),p.getBedrooms(),p.getBathrooms(),p.isParking(),p.getMetro_distance(),p.getPrice()
			);
		}
		
		
		//display proprty
		public List<PropertyDisplay> getAllProperty(){

			String sql="""
			select 
			p.property_id,
			s.statename,
			c.name as city,
			l.locationname,
			p.area_sqft,
			p.bedrooms,
			p.bathrooms,
			p.parking,
			p.metro_distance,
			p.price
			from property p
			join location l on p.locationcode=l.locationcode
			join city c on l.cid=c.id
			join state s on c.statecode=s.statecode
			""";

			return jdbc.query(sql,(rs,row)->{

			PropertyDisplay p=new PropertyDisplay();

			p.setProperty_id(rs.getInt("property_id"));
			p.setStatename(rs.getString("statename"));
			p.setCity(rs.getString("city"));
			p.setLocationname(rs.getString("locationname"));
			p.setArea_sqft(rs.getFloat("area_sqft"));
			p.setBedrooms(rs.getInt("bedrooms"));
			p.setBathrooms(rs.getInt("bathrooms"));
			p.setParking(rs.getBoolean("parking"));
			p.setMetro_distance(rs.getFloat("metro_distance"));
			p.setPrice(rs.getInt("price"));

			return p;

			});

			}

			//search and delete property
		@Override
		public List<Property> searchProperty(String city) {
			
			 List<Property> list = jdbc.query(
				        "select p.property_id, s.statename, c.name as city, l.locationname, " +
				        "p.area_sqft, p.bedrooms, p.bathrooms, p.parking, p.metro_distance, p.price " +
				        "from property p " +
				        "join location l on p.locationcode=l.locationcode " +
				        "join city c on l.cid=c.id " +
				        "join state s on c.statecode=s.statecode " +
				        "where c.name like '%" + city + "%'",
				        
				        new RowMapper<Property>() {

				            @Override
				            public Property mapRow(ResultSet rs, int rowNum) throws SQLException {

				                Property p = new Property();

				                p.setProperty_id(rs.getInt("property_id"));
				                p.setStatename(rs.getString("statename"));
				                p.setCity(rs.getString("city"));
				                p.setLocationname(rs.getString("locationname"));
				                p.setArea_sqft(rs.getInt("area_sqft"));
				                p.setBedrooms(rs.getInt("bedrooms"));
				                p.setBathrooms(rs.getInt("bathrooms"));
				                p.setParking(rs.getBoolean("parking"));
				                p.setMetro_distance(rs.getInt("metro_distance"));
				                p.setPrice(rs.getInt("price"));

				                return p;
				            }
				        });

				    return list;
		}

		@Override
		public void deleteProperty(int id) {
		    String sql = "delete from property where property_id = ?";
		    jdbc.update(sql, id);
		}
		
		//update
		  public int updateProperty(Property p){
		        String sql = "update property set locationcode=?, area_sqft=?, bedrooms=?, bathrooms=?, parking=?, metro_distance=?, price=? where property_id=?";

		        return jdbc.update(sql,
		                p.getLocationcode(),
		                p.getArea_sqft(),
		                p.getBedrooms(),
		                p.getBathrooms(),
		                p.isParking(),
		                p.getMetro_distance(),
		                p.getPrice(),
		                p.getProperty_id()
		        );
		    }
		  
		  public Property getPropertyById(int id){

			  String sql = "select property_id, locationcode, area_sqft, bedrooms, bathrooms, parking, metro_distance, price from property where property_id=?";

			    List<Property> list = jdbc.query(sql,
			            new BeanPropertyRowMapper<>(Property.class), id);

			    if(list.isEmpty()){
			        return null;
			    }

			    return list.get(0);
			}

		  //inquiry
		  public List<Inquiry> getAllInquiries() {

			    String sql = "select * from inquiry order by id desc";

			    return jdbc.query(sql, (rs, rowNum) -> {
			        Inquiry i = new Inquiry();
			        i.setId(rs.getInt("id"));
			        i.setName(rs.getString("name"));
			        i.setEmail(rs.getString("email"));
			        i.setMessage(rs.getString("message"));
			        return i;
			    });
			}
}