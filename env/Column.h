#ifndef PROJECT_COLUMN_H
#define PROJECT_COLUMN_H

#include <string>
#include <iostream>
#include <map>
#include "DataType.h"

class Column {
public:
	Column(std::string name, DataType::Type type);
	std::string get_name();
	DataType::Type get_type();

private:
	std::string name;
	DataType::Type type;
};


#endif //PROJECT_COLUMN_H
