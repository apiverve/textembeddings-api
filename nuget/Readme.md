Text Embeddings API
============

Text Embeddings turns a sentence, paragraph or short document into a 384-dimension vector that captures its meaning, ready for semantic search, clustering, deduplication and recommendations. Send one text or a batch of up to 32, and add a compare text to get the cosine similarity of each one to it in the same call.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.TextEmbeddings.svg)](https://www.nuget.org/packages/APIVerve.API.TextEmbeddings)

This is a .NET wrapper for the [Text Embeddings API](https://apiverve.com/marketplace/textembeddings?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.TextEmbeddings
```

Using the Package Manager:
```
nuget install APIVerve.API.TextEmbeddings
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.TextEmbeddings
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.TextEmbeddings"
5. Click on the APIVerve.API.TextEmbeddings package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Text Embeddings API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.TextEmbeddings;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new TextEmbeddingsQueryOptions {
            Text = "How do I reset my password?",
            Compare = "I forgot my login credentials"
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Text Embeddings API documentation is found here: [https://docs.apiverve.com/ref/textembeddings](https://docs.apiverve.com/ref/textembeddings?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Text Embeddings API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.TextEmbeddings;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new TextEmbeddingsQueryOptions {
            Text = "How do I reset my password?",
            Compare = "I forgot my login credentials"
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.TextEmbeddings;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new TextEmbeddingsQueryOptions {
            Text = "How do I reset my password?",
            Compare = "I forgot my login credentials"
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.TextEmbeddings;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new TextEmbeddingsQueryOptions {
            Text = "How do I reset my password?",
            Compare = "I forgot my login credentials"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.TextEmbeddings;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new TextEmbeddingsQueryOptions {
            Text = "How do I reset my password?",
            Compare = "I forgot my login credentials"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new TextEmbeddingsQueryOptions {
    Text = "How do I reset my password?",
    Compare = "I forgot my login credentials"
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new TextEmbeddingsQueryOptions {
    Text = "How do I reset my password?",
    Compare = "I forgot my login credentials"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new TextEmbeddingsQueryOptions {
    Text = "How do I reset my password?",
    Compare = "I forgot my login credentials"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new TextEmbeddingsQueryOptions {
    Text = "How do I reset my password?",
    Compare = "I forgot my login credentials"
};

using (var apiClient = new TextEmbeddingsAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "model": "all-MiniLM-L6-v2",
    "dimensions": 384,
    "normalized": true,
    "embedding": [
      0.015935,
      -0.051158,
      -0.08069,
      -0.037722,
      -0.041567,
      0.069786,
      0.012189,
      0.027276,
      0.069194,
      0.022245,
      -0.042573,
      0.037621,
      0.043625,
      -0.041836,
      -0.056157,
      0.00667,
      -0.068362,
      0.112544,
      -0.021071,
      -0.090057,
      0.004028,
      -0.031519,
      -0.041218,
      -0.011646,
      0.013743,
      -0.016609,
      -0.002956,
      0.030607,
      -0.106868,
      0.001514,
      0.001547,
      0.020945,
      0.028474,
      0.027638,
      -0.010214,
      0.04415,
      -0.042242,
      0.011779,
      0.043924,
      -0.008672,
      -0.089182,
      -0.020857,
      -0.087462,
      0.028674,
      0.08814,
      0.025155,
      -0.042181,
      0.054494,
      0.048532,
      0.009761,
      0.107937,
      0.000774,
      0.000686,
      -0.028623,
      -0.058207,
      0.059224,
      0.065291,
      0.063502,
      0.056031,
      0.041444,
      0.018389,
      0.006527,
      -0.025379,
      0.100695,
      -0.071208,
      -0.020917,
      -0.005925,
      0.004708,
      0.040568,
      -0.020998,
      -0.091728,
      -0.046622,
      -0.084695,
      -0.031808,
      0.01667,
      0.02989,
      0.005032,
      -0.055746,
      0.063165,
      0.116765,
      -0.071768,
      -0.022474,
      -0.009307,
      0.049127,
      0.118566,
      0.059996,
      0.023227,
      -0.007489,
      0.011,
      -0.040044,
      0.051527,
      -0.027689,
      -0.051349,
      -0.011261,
      -0.111196,
      -0.012924,
      0.044306,
      0.022978,
      -0.071736,
      0.056197,
      0.044321,
      -0.024127,
      0.003852,
      -0.074818,
      0.042519,
      -0.046473,
      0.117393,
      0.08601,
      -0.013658,
      0.028927,
      0.032663,
      -0.044648,
      0.012891,
      0.058705,
      0.011859,
      -0.008381,
      -0.026583,
      0.007164,
      0.017871,
      0.027932,
      -0.041322,
      0.008515,
      0.001873,
      -0.02367,
      -0.050241,
      -0.017463,
      -0.034542,
      0,
      -0.062251,
      0.004076,
      -0.036463,
      0.010555,
      -0.039321,
      -0.067142,
      0.013812,
      -0.071026,
      -0.051261,
      0.057907,
      0.023454,
      0.01625,
      -0.045207,
      -0.087902,
      -0.019768,
      0.007788,
      -0.019921,
      0.007324,
      -0.012854,
      -0.001863,
      -0.019662,
      0.017874,
      0.079734,
      -0.008303,
      0.015725,
      -0.036594,
      0.025994,
      -0.032027,
      -0.036135,
      0.019403,
      -0.017327,
      -0.000511,
      0.000872,
      0.019909,
      -0.057479,
      0.000474,
      0.075845,
      -0.030035,
      -0.042511,
      0.026453,
      -0.026771,
      -0.029517,
      0.051743,
      -0.069742,
      0.054797,
      0.000037,
      0.026588,
      0.054662,
      0.030867,
      0.008791,
      -0.051588,
      -0.002533,
      0.003057,
      0.002774,
      0.017355,
      0.007094,
      0.012687,
      -0.045407,
      -0.086406,
      -0.068595,
      0.086327,
      0.036987,
      -0.026459,
      0.001031,
      0.021954,
      -0.049635,
      0.074866,
      -0.04183,
      -0.000295,
      0.049797,
      -0.029262,
      0.013973,
      -0.023409,
      0.029798,
      -0.103474,
      0.039347,
      0.038171,
      0.05988,
      -0.052313,
      0.049653,
      -0.004409,
      0.017919,
      -0.077781,
      0.080555,
      -0.046249,
      0.016249,
      0.017335,
      0.084156,
      -0.00726,
      -0.032936,
      -0.054922,
      -0.012744,
      0.075304,
      -0.121707,
      -0.082506,
      0,
      -0.007864,
      -0.066508,
      0.030534,
      -0.022107,
      0.0539,
      -0.021819,
      -0.002716,
      0.043627,
      -0.021448,
      -0.015385,
      0.057646,
      0.122854,
      0.0182,
      -0.029586,
      0.134486,
      0.085412,
      -0.035002,
      0.090932,
      -0.125456,
      -0.00437,
      -0.102856,
      0.051666,
      -0.002521,
      -0.02113,
      0.043273,
      -0.002127,
      0.021891,
      0.082963,
      0.011011,
      0.001568,
      0.069904,
      -0.016033,
      -0.003045,
      0.153703,
      0.050273,
      -0.014532,
      0.085554,
      0.009679,
      -0.055562,
      -0.031634,
      0.005374,
      0.042663,
      -0.010425,
      -0.005738,
      -0.049902,
      -0.008218,
      0.037462,
      -0.052941,
      0.01358,
      0.037513,
      -0.028075,
      -0.065099,
      0.100573,
      -0.064201,
      -0.009629,
      0.021812,
      0.052269,
      -0.016687,
      0.005393,
      -0.102985,
      -0.025369,
      0.079842,
      -0.016843,
      0.038335,
      -0.01167,
      0.001197,
      -0.026137,
      -0.022323,
      -0.076328,
      0.062972,
      -0.044764,
      0.10601,
      0.076878,
      0.01546,
      0.106406,
      -0.109352,
      -0.071418,
      0.039775,
      -0.086625,
      -0.01426,
      0.097484,
      -0.014352,
      -0.068561,
      -0.052108,
      -0.070306,
      -0.094529,
      0.02975,
      0.049288,
      0.046155,
      -0.007938,
      -0.040781,
      -0.036678,
      0.006408,
      -0.000094,
      0.000799,
      0,
      -0.013822,
      -0.056042,
      0.082071,
      0.005924,
      0.087829,
      0.032089,
      -0.048997,
      0.01165,
      -0.088562,
      -0.088651,
      -0.038811,
      0.027432,
      0.026942,
      0.006228,
      -0.028242,
      -0.031951,
      -0.059847,
      -0.008865,
      0.022552,
      0.016139,
      -0.03609,
      -0.003508,
      -0.021258,
      -0.07641,
      0.07868,
      0.076684,
      -0.007732,
      0.084901,
      0.052902,
      -0.017653,
      -0.038105,
      0.021126,
      -0.002817,
      -0.066709,
      -0.164925,
      -0.023914,
      -0.029452,
      0.008349,
      -0.025644,
      -0.014505,
      0.010479,
      0.051549,
      0.051218,
      0.066133,
      -0.05291,
      0.003186,
      0.018309,
      0.018868,
      0.026376,
      0.008602,
      -0.110013,
      0.091777,
      0.025643,
      0.065606,
      -0.017918,
      0.005675,
      0.047761,
      -0.047534,
      -0.111482,
      -0.006169,
      0.020921,
      0.069579,
      0.001407,
      -0.082195
    ],
    "characters": 27,
    "similarity": 0.6762
  }
}
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
