def get_in(object:dict, key:str):

    keys = key.split("/")

    val = None

    for index, each in enumerate(keys):
        if not index:
            val = eval(object).get(each)
            continue
        val = val.get(each)

    return val
    


if __name__ == "__main__":
    object2 = '{"x":{"y":{"z":"a"}}}'
    key2 = "x/y/z"
    print(get_in(object2, key2))
