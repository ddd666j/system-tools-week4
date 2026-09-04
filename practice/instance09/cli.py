import argparse,json
p=argparse.ArgumentParser(); p.add_argument('--name',required=True); p.add_argument('--json',action='store_true'); a=p.parse_args(); data={'message':f'Hello, {a.name}!','student':'25020007021'}; print(json.dumps(data) if a.json else data['message'])
