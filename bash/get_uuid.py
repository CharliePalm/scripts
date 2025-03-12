import uuid
from argparse import ArgumentParser
args = ArgumentParser()
args.add_argument('--hash', '-H', required=False)
args.add_argument('--encode', '-e', action='store_true', default=False)

args = args.parse_args()
if not args.hash:
    result = str(uuid.uuid4())
else:
    null_uuid: uuid.UUID = uuid.UUID("00000000-0000-0000-0000-000000000000")
    result = uuid.uuid5(namespace=null_uuid, name=args.hash)

result = str(result).encode('ascii').hex() if args.encode else str(result)
print(result)
