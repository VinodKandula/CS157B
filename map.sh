#define json
json='
{
	"settings" : {"keyspace" : "yelp"},
	"mappings" : 
	{	
		"review" : 
		{
			"properties" : 
			{
				"review_id"	: { "type" : "string", "cql_collection" : "singleton", "cql_primary_key_order" : 0 }, 
				"user_id" 	: { "type" : "string", "cql_collection" : "singleton" }, 
				"business_id" 	: { "type" : "string", "cql_collection" : "singleton" }, 
				"funny" 	: { "type" : "integer", "cql_collection" : "singleton" },
				"useful" 	: { "type" : "integer", "cql_collection" : "singleton" },
				"cool" 		: { "type" : "integer", "cql_collection" : "singleton" },
				"stars" 	: { "type" : "double", "cql_collection" : "singleton" },
				"date" 		: { "type" : "string", "cql_collection" : "singleton" },
				"text"	 	: { "type" : "string", "cql_collection" : "singleton" },
				"type"	 	: { "type" : "string", "cql_collection" : "singleton" }
			}	
		},	
		"tip" : 
		{
			"properties" : 
			{
				"tip_id"	: { "type" : "string", "cql_collection" : "singleton", "cql_primary_key_order" : 0 }, 
				"user_id" 	: { "type" : "string", "cql_collection" : "singleton" }, 
				"text"	 	: { "type" : "string", "cql_collection" : "singleton" }, 
				"business_id" 	: { "type" : "string", "cql_collection" : "singleton" },
				"likes"		: { "type" : "integer", "cql_collection" : "singleton" },
				"date" 		: { "type" : "string", "cql_collection" : "singleton" },
				"type" 		: { "type" : "string", "cql_collection" : "singleton" }
			}	
		},
		"checkin" : 
		{
			"properties" : 
			{
				"checkin_id"	: { "type" : "string", "cql_collection" : "singleton", "cql_primary_key_order": 0 }, 
				"time" 		: { "type" : "string", "cql_collection" : "list" }, 
				"business_id" 	: { "type" : "string", "cql_collection" : "singleton" }, 
				"type"	 	: { "type" : "string", "cql_collection" : "singleton" }
			}	
		},
		"business" : 
		{
			"properties" : 
			{
				"business_id"	: { "type" : "string", "cql_collection" : "singleton", "cql_primary_key_order": 0 }, 
				"address" 	: { "type" : "string", "cql_collection" : "singleton" }, 
				"hours" 	: { "type" : "string", "cql_collection" : "list" }, 
				"is_open" 	: { "type" : "integer", "cql_collection" : "singleton" },
				"categories" 	: { "type" : "string", "cql_collection" : "list" },
				"city" 		: { "type" : "string", "cql_collection" : "singleton" },
				"review_count" 	: { "type" : "integer", "cql_collection" : "singleton" },
				"name" 		: { "type" : "string", "cql_collection" : "singleton" },
				"neighborhood" 	: { "type" : "string", "cql_collection" : "singleton" },
				"postal_code" 	: { "type" : "string", "cql_collection" : "singleton" },
				"longitude" 	: { "type" : "double", "cql_collection" : "singleton" } ,
				"latitude" 	: { "type" : "double", "cql_collection" : "singleton" },
				"state" 	: { "type" : "string", "cql_collection" : "singleton" },
				"stars" 	: { "type" : "double", "cql_collection" : "singleton" },
				"attributes" 	: { "type" : "string", "cql_collection" : "list" },
				"type" 		: { "type" : "string", "cql_collection" : "singleton" }
			}	
		}
	}
}'
user='{
"user" : 
{
	"properties" : 
	{
		"user_id"	: { "type" : "string", "cql_collection" : "singleton", "cql_primary_key_order": 0 }, 
		"name"	 	: { "type" : "string", "cql_collection" : "singleton" }, 
		"yelping_since"	: { "type" : "string", "cql_collection" : "singleton" }, 
		"review_count" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"friends" 	: { "type" : "string", "cql_collection" : "set" },
		"fans" 		: { "type" : "integer", "cql_collection" : "singleton" },
		"average_stars"	: { "type" : "double", "cql_collection" : "singleton" },
		"type" 		: { "type" : "string", "cql_collection" : "singleton" },
		"useful" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"funny" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"cool" 		: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_photos"	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_list" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_funny" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_plain" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_note" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_writer" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_cute" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_more" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_hot" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_profile" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"compliment_cool" 	: { "type" : "integer", "cql_collection" : "singleton" },
		"elite"			: { "type" : "string", "cql_collection" : "list"}
	}
}
}'

#remove existing index
curl -XDELETE 'localhost:9200/yelp?pretty=true'
echo $json | curl -XPUT 'localhost:9200/yelp?pretty=true' -d @-
echo $user | curl -XPUT 'localhost:9200/yelp/_mapping/user?pretty=true' -d @-
