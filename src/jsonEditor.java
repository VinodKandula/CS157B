import org.json.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;

public class jsonEditor {
	public static void main(String[] args) throws JSONException, IOException{
		//Commenting out JSON files I've already written since these take a long time to run.
		//Not editing Review, Tip, or Checkin because there's nothing to change in them as they are relatively simple.
		
		//ArrayList<JSONObject> businessList = readJSON("C:\\Users\\Mike\\Desktop\\CS157B\\business.json");
		//writeBusiness(businessList);
		//ArrayList<JSONObject> userList = readJSON("C:\\Users\\Mike\\Desktop\\CS157B\\user.json");
		//writeUser(userList);
		ArrayList<JSONObject> businessList = readJSON("C:\\Users\\Mike\\Desktop\\CS157B\\businessNew.json");
		businessToCSV(businessList);		
	}
	public static void writeBusiness(ArrayList<JSONObject> jsonList) throws JSONException, IOException{
		FileWriter file = new FileWriter("C:\\Users\\Mike\\Desktop\\CS157B\\businessNew.json");
		try{
			for(int i = 0; i < jsonList.size(); i++){
				JSONObject json = jsonList.get(i);
				Double latitude = (Double) json.get("latitude");
				Double longitude = (Double) json.get("longitude");
				double[] location = {latitude, longitude};
				json.remove("latitude");
				json.remove("longitude");
				json.put("location", location);
				file.write(json.toString() + "\n");
			}
			System.out.println("Finished");
		} catch(IOException e){
			e.printStackTrace();
		}
		finally{
			file.close();
		}
		
	}
	public static void writeUser(ArrayList<JSONObject> jsonList) throws JSONException, IOException{
		FileWriter file = new FileWriter("C:\\Users\\Mike\\Desktop\\CS157B\\userNew.json");
		try{
			for(int i = 0; i < jsonList.size(); i++){
				JSONObject json = jsonList.get(i);
				//There's no way to use regex to get(regexKey) so we have to do this the hard way...
				
				int compliment_photos = (Integer) json.get("compliment_photos");
				int compliment_list = (Integer) json.get("compliment_list");
				int compliment_funny = (Integer) json.get("compliment_funny");
				int compliment_plain = (Integer) json.get("compliment_plain");
				int compliment_note = (Integer) json.get("compliment_note");
				int compliment_writer = (Integer) json.get("compliment_writer");
				int compliment_cute = (Integer) json.get("compliment_cute");
				int compliment_more = (Integer) json.get("compliment_more");
				int compliment_hot = (Integer) json.get("compliment_hot");
				int compliment_profile = (Integer) json.get("compliment_profile");
				int compliment_cool = (Integer) json.get("compliment_cool");
				
				int[] compliments = {compliment_photos, compliment_list, compliment_funny, compliment_plain,
						compliment_note, compliment_writer, compliment_cute, compliment_more, compliment_hot,
						compliment_profile, compliment_cool};
				json.remove("compliment_photos");
				json.remove("compliment_list");
				json.remove("compliment_funny");
				json.remove("compliment_plain");
				json.remove("compliment_note");
				json.remove("compliment_writer");
				json.remove("compliment_cute");
				json.remove("compliment_more");
				json.remove("compliment_hot");
				json.remove("compliment_profile");
				json.remove("compliment_cool");
				
				json.put("compliments", compliments);
				file.write(json.toString() + "\n");
			}
			System.out.println("Finished");
		} catch(IOException e){
			e.printStackTrace();
		}
		finally{
			file.close();
		}
		
	}
	public static void businessToCSV(ArrayList<JSONObject> jsonList) throws IOException{
		FileWriter file = new FileWriter("C:\\Users\\Mike\\Desktop\\CS157B\\business.csv");
		try{
			String header = "business_id,name,address,city,state,postal_code,neighborhood,location,stars,review_count,"
					+ "is_open,attributes,categories,hours,type\n";
			file.write(header);
			
			//split string into array cause I'm lazy
			StringTokenizer tokenizer = new StringTokenizer(header, ",\n");
			ArrayList<String> headers = new ArrayList<String>();
			while (tokenizer.hasMoreTokens()){
				headers.add(tokenizer.nextToken());
			}	
			System.out.println("Headers: " + headers.size());
			System.out.println("List: " + jsonList.size());
			
			for(int i = 0; i < jsonList.size(); i++){
				StringBuilder sb = new StringBuilder();
				JSONObject json = jsonList.get(i);
				for(int j = 0; j < headers.size(); j++){
					try {
						String h = headers.get(j);
						sb.append("\"" + json.get(h) + "\",");
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
				//removes the last ','
				sb.setLength(sb.length() - 1);
				file.write(sb.toString() + "\n");
				
				//System.out.println(sb.toString() + "\n");
			}
		} catch (IOException e){
			e.printStackTrace();
		}
		finally{
			file.close();
		}
	}
	public static void userToCSV(ArrayList<JSONObject> jsonList) throws IOException{
		FileWriter file = new FileWriter("C:\\Users\\Mike\\Desktop\\CS157B\\user.csv");
		try{
			String header = "";
			
		}
		finally{
			file.close();
		}
	}
	public static ArrayList<JSONObject> readJSON(String fileName) throws JSONException{
		ArrayList<JSONObject> result = new ArrayList<JSONObject>();
		try{
			BufferedReader br = new BufferedReader(new FileReader(fileName));
			String line = br.readLine();
			//uncomment i if JSON file is too big and we need to cut it down
			int i =0;
			while(line != null){
				i++;
				if(i == 500000){
					System.out.println(i);
					break;
				}
				//One new JSON object per line
				JSONObject json = new JSONObject(line);
				result.add(json);
				line = br.readLine();
			}

		} catch(IOException e){
			e.printStackTrace();
		}
		System.out.println("Finished reading: " + fileName);
		return result;
	}
}
