# idempotent-keys

The `idempotent-keys` module is designed to generate UUIDs (Universally Unique Identifiers) based on a provided blob of data. It adheres to the UUID version 4 (UUIDv4) specification, as defined by RFC4122. The UUIDv4 specification requires 128 bits (16 bytes) of data to ensure that the possibility of generating duplicate UUIDs is statistically negligible.

## Features

- **UUID Generation**: Creates a UUIDv4 string from a random or pseudo-random 16-byte blob.
- **RFC4122 Compliance**: Ensures that the generated UUIDs conform to the UUIDv4 format.

## Usage

To use this module, you need to import it and provide a 16-byte (or larger) blob of random data.

### Importing the Module

First, import the module into your project:

```motoko
import UUID "idempotency-keys";
```

### Generating Random Data

Next, generate a random blob of data to be used as the seed for the UUID generation. This can be done using a random data generator, such as:

```motoko
let entropy = await Random.blob();
```

### Generating a UUID

Finally, generate the UUID by calling the `generateV4` function with the random data:

```motoko
let idempotent_key: Text = UUID.generateV4(entropy);
```

## API Reference

### Functions

- `generateV4(seed: Blob) : Text`
  
  Generates a UUIDv4 string from the provided blob of data.

  **Parameters:**
  - `seed` (Blob): A blob of data at least 16 bytes in length.
  
  **Returns:**
  - `Text`: A UUIDv4 string.
  - eg: 2d267c72-9436-40a5-b632-2b0a44a81531
