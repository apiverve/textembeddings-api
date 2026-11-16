using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.TextEmbeddings
{
    /// <summary>
    /// Query options for the Text Embeddings API
    /// </summary>
    public class TextEmbeddingsQueryOptions
    {
        /// <summary>
        /// The text to embed, up to 10,000 characters. Send text or texts
        /// </summary>
        [JsonProperty("text")]
        public string Text { get; set; }

        /// <summary>
        /// A JSON array of texts to embed in one call: up to 32 on paid plans and 4 on the Free plan, 10,000 characters each and 50,000 in total. Send text or texts
        /// </summary>
        [JsonProperty("texts")]
        public List<string>? Texts { get; set; }

        /// <summary>
        /// Optional reference text; each embedding gets its cosine similarity to it
        /// </summary>
        [JsonProperty("compare")]
        public string Compare { get; set; }
    }
}
