import java.io.*;
import java.util.*;
public class SumCode{
	
	public static void main(String[] args) throws IOException{
		Scanner r = new Scanner(new File("data.txt"));
		int sum = 0; //Take the total sum of the list
		ArrayList<String> values = new ArrayList<String>();//How I can store the values
		while(r.hasNext()){
			String line = r.nextLine(); //Get the line
			values.add(line);
			int num = Integer.parseInt(line.substring(1)); //Get an integer
			String val = line.substring(0,1); //Figure out the sign
			if (val.equals("+")) //Change sum respectively due to sign
				sum += num;
			else
				sum -= num;
		}
		r.close();
		System.out.println(sum);
		System.out.println(DoubleFrequency(values));
	}

	public static int DoubleFrequency(ArrayList<String> values){
		ArrayList<Integer> sums = new ArrayList<Integer>(); //Storing previous sum values
		int sum = 0;
		while (true){ //List repeats at the end
		for (int i = 0; i < values.size(); i++){ //Loops through list
			int num = Integer.parseInt(values.get(i).substring(1)); //Parsing integer
			String val = values.get(i).substring(0,1); //finding sign
			if (val.equals("+")) //change sum respectively
				sum += num;
			else
				sum -= num;
			for (int z = 0; z < sums.size(); z++){ //find if sum is same as previous sum
				if (sum == sums.get(z))
					return sum;						
			}	
			sums.add(sum);
		}
		}
	}
}
