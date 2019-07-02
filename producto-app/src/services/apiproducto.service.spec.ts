import { TestBed } from '@angular/core/testing';

describe('ApiproductoService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ApiproductoService = TestBed.get(ApiproductoService);
    expect(service).toBeTruthy();
  });
});
