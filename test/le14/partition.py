# partition

def tree(label, branches = []):
    for branch in branches:
        assert is_tree(branch), 'branch must be a tree'
    return [label] + list(branches)

def label(tree):
    return tree[0]

def branches(tree):
    return tree[1:]

def is_tree(tree):
    if type(tree) != list or len(tree) < 1:
        return False
    for branch in branches(tree):
        if not is_tree(branch):
            return False
    return True

def is_leaf(tree):
    return not branches(tree)

def partition_tree(n, m):
    """
    返回将n分割成不超过m的若干正整数之和的分割树
    >>> partition_tree(2, 2)
    [2, [True], [1, [1, [True], [False]], [False]]]
    """
    if n == 0:
        return tree(True)
    elif n < 0 or m == 0:
        return tree(False)
    else:
        left = partition_tree(n - m, m)
        right = partition_tree(n, m - 1)
        return tree(m, [left, right])

def print_parts(tree, partition = []):
    if is_leaf(tree):
        if label(tree):
            print(' + '.join(partition))

    else:
        left, right = branches(tree)
        m = str(label(tree))
        print_parts(left, partition + [m])
        print_parts(right, partition)
