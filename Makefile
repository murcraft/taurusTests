##################
# Basic commands #
##################

run_DLA_low:
	chmod -R a=rwx $(PWD)
	chmod -Rf 777 .
	echo "PWD $(PWD)"
	docker run -it --rm \
	-v $(PWD)/lib/scripts/pls:/bzt-configs \
	-v $(PWD)/lib/artifacts:/tmp/artifacts blazemeter/taurus:latest DLA_low_load.yml \
	-o execution.0.scenario=$(scenario) \
	-o modules.blazemeter.token=$(token) \
	-o modules.blazemeter.report-name=$(scenario) \
	-o modules.blazemeter.test="Test DLA load low" \
	-report \
	-sequential

run_DLA_high:
	chmod -R a=rwx $(PWD)
	chmod -Rf 777 .
	docker run -it --rm \
	-v $(PWD)/lib/scripts/pls:/bzt-configs \
	-v $(PWD)/lib/artifacts:/tmp/artifacts blazemeter/taurus:latest DLA_high_load.yml \
	-o execution.0.scenario=$(scenario) \
	-o modules.blazemeter.token=$(token) \
	-o modules.blazemeter.report-name=$(scenario) \
	-o modules.blazemeter.test="Test DLA load high" \
	-report \
	-sequential

run_IDX_low:
	chmod -R a=rwx $(PWD)
	chmod -Rf 777 .
	docker run -it --rm \
	-v $(PWD)/lib/scripts/pls:/bzt-configs \
	-v $(PWD)/lib/artifacts:/tmp/artifacts blazemeter/taurus:latest IDX_low_load.yml \
	-o execution.0.scenario=$(scenario) \
	-o modules.blazemeter.token=$(token) \
	-o modules.blazemeter.report-name=$(scenario) \
	-o modules.blazemeter.test="Test IDX load low" \
	-report \
	-sequential

run_IDX_high:
	chmod -R a=rwx $(PWD)
	chmod -Rf 777 .
	docker run -it --rm \
	-v $(PWD)/lib/scripts/pls:/bzt-configs \
	-v $(PWD)/lib/artifacts:/tmp/artifacts blazemeter/taurus:latest IDX_high_load.yml \
	-o execution.0.scenario=$(scenario) \
	-o modules.blazemeter.token=$(token) \
	-o modules.blazemeter.report-name=$(scenario) \
	-o modules.blazemeter.test="Test IDX load high" \
	-report \
	-sequential