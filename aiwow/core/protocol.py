
def deserialize(img):
    d = img.flatten()

    l = _pix2int(d[:4])



def _pix2int(data):
    N = 0
    for b in data:
        N = N << 8
        N += b
    return N


def _pix2str(data):
    