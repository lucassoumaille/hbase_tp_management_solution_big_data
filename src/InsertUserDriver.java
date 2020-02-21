import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.mapreduce.TableMapReduceUtil;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

// export HADOOP_CLASSPATH=/usr/lib/hbase/lib/*

public class InsertUserDriver extends Configured implements Tool {

	public static void main(String[] args) throws Exception {
		System.exit(ToolRunner.run(new Configuration(), new InsertUserDriver(), args));
	}

	@Override
	public int run(String[] args) throws Exception {
		Job job = Job.getInstance(this.getConf(), "InsertUsers");
		
		job.setJarByClass(this.getClass());
		job.setMapperClass(ReadFileMapper.class);
		job.setNumReduceTasks(10);
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(Text.class);
		job.setInputFormatClass(TextInputFormat.class);
		FileInputFormat.addInputPath(job, new Path(args [0]));
		TableMapReduceUtil.initTableReducerJob("users", InsertUsersReducer.class, job);
		return job.waitForCompletion(true) ? 0 : -1;
	}

}
