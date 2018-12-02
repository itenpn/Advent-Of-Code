import java.io.*;
import java.util.*;
public class SumCode{
	
	public static void main(String[] args) throws IOException{
		Scanner r = new Scanner(new File("data.txt"));
		int sum = 0;
		ArrayList<String> values = new ArrayList<String>();
		while(r.hasNext()){
			String line = r.nextLine();
			values.add(line);
			int num = Integer.parseInt(line.substring(1));
			String val = line.substring(0,1);
			if (val.equals("+"))
				sum += num;
			else
				sum -= num;
		}
		r.close();
		System.out.println(sum);
		System.out.println(DoubleFrequency(values));
	}

	public static int DoubleFrequency(ArrayList<String> values){
		ArrayList<Integer> sums = new ArrayList<Integer>();
		int sum = 0;
		while (true){
		for (int i = 0; i < values.size(); i++){
			int num = Integer.parseInt(values.get(i).substring(1));
			String val = values.get(i).substring(0,1);
			if (val.equals("+"))
				sum += num;
			else
				sum -= num;
			for (int z = 0; z < sums.size(); z++){
				if (sum == sums.get(z))
					return sum;						
			}	
			System.out.println(sum);
			sums.add(sum);
		}
		}
	}
}
