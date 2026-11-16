declare module '@apiverve/textembeddings' {
  export interface textembeddingsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface textembeddingsResponse {
    status: string;
    error: string | null;
    data: TextEmbeddingsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface TextEmbeddingsData {
      model:      null | string;
      dimensions: number | null;
      normalized: boolean | null;
      embedding:  (number | null)[];
      characters: number | null;
      similarity: number | null;
  }

  export default class textembeddingsWrapper {
    constructor(options: textembeddingsOptions);

    execute(callback: (error: any, data: textembeddingsResponse | null) => void): Promise<textembeddingsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: textembeddingsResponse | null) => void): Promise<textembeddingsResponse>;
    execute(query?: Record<string, any>): Promise<textembeddingsResponse>;
  }
}
