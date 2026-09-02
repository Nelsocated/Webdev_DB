export interface Pie {
  id?: string;
  name: string;
  crust_type: string;
  filling: string;
  is_baked?: boolean;
  slice_count?: number;
}

export type BodyPie = Partial<Pie>;
