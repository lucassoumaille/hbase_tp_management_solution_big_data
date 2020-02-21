import java.io.IOException;

import org.apache.hadoop.hbase.client.Mutation;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.mapreduce.TableReducer;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;


public class InsertUsersReducer extends TableReducer<Text, Text, NullWritable> {
	@Override
	protected void reduce(Text key, Iterable<Text> values,
			Reducer<Text, Text, NullWritable, Mutation>.Context context)
			throws IOException, InterruptedException {
		for(Text value : values) {
			String [] fields = value.toString().split(";");
			String [] names = fields[0].split(" ");
			Put set = new Put(Bytes.toBytes(key.toString()));
			
			set.addColumn(Bytes.toBytes("name"), Bytes.toBytes("first"), Bytes.toBytes(names[0]));
			set.addColumn(Bytes.toBytes("name"), Bytes.toBytes("last"), Bytes.toBytes(names[0]));
			try {
				set.addColumn(Bytes.toBytes("year"), Bytes.toBytes("year"), Bytes.toBytes(Integer.parseInt(fields[1])));
				context.write(NullWritable.get(), set);
				break;
			}
			catch(NumberFormatException e) {
				context.getCounter("Errors", "Bad year").increment(1);
			}
		}
	}
}
