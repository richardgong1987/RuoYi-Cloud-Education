package com.ruoyi.file.api;

import com.ruoyi.file.config.es.FileSearch;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface IElasticSearchService extends ElasticsearchRepository<FileSearch, Long> {

}
