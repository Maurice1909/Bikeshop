from flask import Flask, render_template

app = Flask(__name__)

# In-memory database of bikes
BIKES = {
    'cannondale': [
        {'id': 1, 'name': 'Cannondale Trail 5', 'price': 850, 'image': 'https://placehold.co/600x400/CCCCCC/333333?text=Trail+5'},
        {'id': 2, 'name': 'Cannondale Synapse', 'price': 2200, 'image': 'https://placehold.co/600x400/CCCCCC/333333?text=Synapse'}
    ],
    'canyon': [
        {'id': 3, 'name': 'Canyon Spectral', 'price': 2800, 'image': 'https://placehold.co/600x400/A3A3A3/333333?text=Spectral'},
        {'id': 4, 'name': 'Canyon Endurace', 'price': 1900, 'image': 'https://placehold.co/600x400/A3A3A3/333333?text=Endurace'}
    ],
    'giant': [
        {'id': 5, 'name': 'Giant Talon 29', 'price': 750, 'image': 'https://placehold.co/600x400/8F8F8F/333333?text=Talon+29'},
        {'id': 6, 'name': 'Giant Contend', 'price': 1500, 'image': 'https://placehold.co/600x400/8F8F8F/333333?text=Contend'}
    ]
}

@app.route('/')
def index():
    """Renders the main shop page showing all bikes."""
    return render_template('index.html', bikes=BIKES)

if __name__ == '__main__':
    app.run(debug=True)
