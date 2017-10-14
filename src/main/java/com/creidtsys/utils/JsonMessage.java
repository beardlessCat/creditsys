package com.creidtsys.utils;
import org.apache.commons.lang3.builder.ToStringBuilder;

public class JsonMessage
{
	public class Meta
	{

		private boolean success;
		private String message;
		final JsonMessage this$0;

		public boolean isSuccess()
		{
			return success;
		}

		public String getMessage()
		{
			return message;
		}

		public String toString()
		{
			return (new ToStringBuilder(this)).append("success", success).append("message", message).toString();
		}

		public Meta(boolean success, String message)
		{
			super();
			this$0 = JsonMessage.this;
			this.success = success;
			this.message = message;
		}
	}


	private static final String OK = "ok";
	private static final String ERROR = "error";
	private Meta meta;
	private Object data;

	public JsonMessage()
	{
	}

	public JsonMessage success()
	{
		meta = new Meta(true, "ok");
		return this;
	}

	public JsonMessage success(Object data)
	{
		meta = new Meta(true, "ok");
		this.data = data;
		return this;
	}

	public JsonMessage failure()
	{
		meta = new Meta(false, "error");
		return this;
	}

	public JsonMessage failure(String message)
	{
		meta = new Meta(false, message);
		return this;
	}

	public Meta getMeta()
	{
		return meta;
	}

	public Object getData()
	{
		return data;
	}

	public String toString()
	{
		return (new ToStringBuilder(this)).append("meta", meta).append("data", data).toString();
	}
}

