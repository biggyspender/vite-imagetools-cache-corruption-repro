import { images } from "./images";

function App() {
  return <pre>{JSON.stringify(images, null, 2)}</pre>;
}

export default App;
