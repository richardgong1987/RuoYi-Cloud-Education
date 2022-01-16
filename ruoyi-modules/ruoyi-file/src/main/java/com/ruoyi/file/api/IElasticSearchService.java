package com.ruoyi.file.api;

import com.ruoyi.file.config.es.FileSearch;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

@Lazy
public interface IElasticSearchService extends ElasticsearchRepository<FileSearch, Long> {

}
