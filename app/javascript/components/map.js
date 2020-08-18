const createMap = () => {
  mapboxgl.accessToken = 'pk.eyJ1Ijoibmljb2siLCJhIjoiY2s5azZpeXFjMTA5NTNxcTZ0dmRqYzJ5byJ9.qwSn_A22cNAy65DeZy5Q8g';
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9',
    center: [2.2530505, 48.8414145],
    zoom: 12
  });
};

export {createMap}

