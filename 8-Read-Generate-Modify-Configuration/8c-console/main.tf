locals {
  list1 = ["apple", "banana", "cherry"]
  list2 = tolist(["cat", "dog", "fish"])
  list3 = range(1, 5)
  list4 = split(",", "red,green,blue")
  list5 = concat(["a", "b"], ["c", "d"])
  list6 = [for item in ["apple", "banana", "cherry"] : upper(item)]
  list7 = [for num in [1, 2, 3, 4, 5] : num if num % 2 == 0]
  list8 = [for i, fruit in ["apple", "banana", "cherry"] : "${i + 1}: ${fruit}"]

  map1 = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
  map2 = tomap({
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  })
  map3 = zipmap(["key1", "key2", "key3"], ["value1", "value2", "value3"])
  map4 = { for i in ["a", "b", "c"] : i => upper(i) }
  map5 = { for i, fruit in ["apple", "banana", "cherry"] : i => upper(fruit) }
  map6 = merge(
    { key1 = "value1" },
    { key2 = "value2" },
    { key3 = "value3" }
  )

  object1 = {
    name  = "example"
    count = 5
    tags  = ["tag1", "tag2"]
  }
  object2 = {
    for key, value in local.object1 : key => value
  }
  object3 = merge(
    { name = "example" },
    { count = 5 },
    { tags = ["tag1", "tag2"] }
  )
  object4 = {
    for key in ["item1", "item2", "item3"] : key => {
      id   = key
      size = length(key)
    }
  }

  tuple1 = ["apple", 42, true]
  tuple2 = tolist(["cat", 42, true])
  tuple3 = concat(["red", "green"], ["blue", 123])
  tuple4 = [for i in range(3) : "item-${i}"]
  tuple5 = [
    length("Terraform"),
    true,
    upper("tuple"),
    { key = "value" }
  ]
}
