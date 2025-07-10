# Linked list

empty = 'empty'

def is_link(s):
    """判断s是否为链表"""
    return s == empty or (len(s) == 2 and is_link(s[1]))

def link(first, rest):
    """用first和rest构建一个链表"""
    assert is_link(rest), "rest 必须是一个链表"
    return [first, rest]

def first(s):
    """返回链表s的第一个元素"""
    assert is_link(s), "first 只能用于链表"
    assert s != empty, "空链表没有第一个元素"
    return s[0]

def rest(s):
    """"返回s的剩余元素"""
    assert is_link(s), "rest只能用于链表"
    assert s != empty, "空链表没有剩余元素"
    return s[1]
