#include "Interface.h"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
using namespace GarrysMod::Lua;

namespace Methods
{
	// A function to get the global table.
	static int GetGlobal(lua_State* state)
	{
			LUA->PushSpecial(SPECIAL_GLOB);
			int Global = LUA->ReferenceCreate();
			LUA->ReferencePush(Global);
			return Global;
	}
	
	// A function to get a field from the global table.
	 static int GetGlobalField(lua_State* state, const char* Name)
	{
			LUA->PushSpecial(GarrysMod::Lua::SPECIAL_GLOB);
			LUA->GetField(-1, Name);
			int Obj = LUA->ReferenceCreate();
			LUA->ReferencePush(Obj);
			return Obj;
			LUA->ReferenceFree(Obj);
	}

	 // You still need to use \n at the end of the message.
	 static int ErrorNoHalt(lua_State* state, const char* message)
	 {
			GetGlobalField(state, "ErrorNoHalt");
			LUA->PushString(message);
			LUA->Call(1, 0);
			LUA->Pop();
			return 0;
	 }

	static int print(lua_State* state, const char* message)
	{
			GetGlobalField(state, "print");
			LUA->PushString(message);
			LUA->Call(1, 0);
			LUA->Pop();
			return 0;
	}
	
	static int pcall(lua_State* state, const char* function, const char* arguments)
	{
			GetGlobalField(state, "pcall");
			LUA->PushString(function);
			LUA->PushString(arguments);
			LUA->Call(2, 0);
			LUA->Pop();
			return 0;
	}


	static int compile(lua_State* state, const char* code)
	{
			GetGlobalField(state, "CompileString"); // leaves a function on top of the stack
			LUA->PushString(code);
			LUA->PushString("RunString");
			LUA->Call(2, 1);
			LUA->Call(0, 0); // Call the returned function on the stack
			LUA->Pop();
			return 0;
	}

	static int CompileFile(lua_State* state, const char* path)
	{
			GetGlobalField(state, "CompileFile");
			LUA->PushString(path);
			LUA->Call(1, 1);

			if (LUA->IsType(-1, Type::FUNCTION))
			{
				LUA->Call(0, 0);
			}

			LUA->Pop();
			return 0;
	}

	 static int RunString(lua_State* state, const char* code)
	{
			GetGlobalField(state, "RunString");
			LUA->PushString(code);
			LUA->Call(1, 0);
			LUA->Pop();
			return 0;
	}

	 static int Error(lua_State* state, const char* message)
	 {
			GetGlobalField(state, "Error");
			LUA->PushString(message);
			LUA->Call(1, 0);
			LUA->Pop();
			return 0;
	 }

	 static int error(lua_State* state, const char* message)
	 {
			GetGlobalField(state, "error");
			LUA->PushString(message);
			LUA->Call(1, 0);
			LUA->Pop();
			return 0;
	 }
	 
	 static int include(lua_State* state, const char* File)
	 {
			GetGlobalField(state, "include");
			LUA->PushString(File);
			LUA->Call(1, 0);
			LUA->Pop();
			return 0;
	 }

	 static int require(lua_State* state, const char* File)
	 {
			GetGlobalField(state, "require");
			LUA->PushString(File);
			LUA->Call(1, 0);
			LUA->Pop();
			return 0;
	 }

	 static int assert(lua_State* state, bool Condition, const char* Message = "assertion failed!")
	 {
			GetGlobalField(state, "assert");
			LUA->PushBool(Condition);
			LUA->PushString(Message);
			LUA->Call(2, 0);
			LUA->Pop();
			return 0;
	 }

	 static int BroadcastLua(lua_State* state, const char* Code)
	 {
			GetGlobalField(state, "BroadcastLua");
			LUA->PushString(Code);
			LUA->Call(1, 0);
			LUA->Pop();
			return 0;
	 }	 


			namespace table
			{
				 static int Create(lua_State* state)
				{
						LUA->CreateTable();
						int TABLE = LUA->ReferenceCreate();
						return TABLE;
				}

				 static int Loop(lua_State* state, int Table, CFunc Function)
				 {
					 LUA->ReferencePush(Table);
					 LUA->PushNil();
					 while (LUA->Next(-2) != 0) {
						 Function(state);
						 LUA->Pop(1);
					 }

					 return 0;
				 }

				 static int PushTable(lua_State* state, int TargetTable, int Table, const char* Name)
				{
						LUA->ReferencePush(TargetTable);
						LUA->ReferencePush(Table);
						LUA->SetField(-2, Name);
						return 0;
				}

				 static int PushCFunc(lua_State* state, int Table, const char* Name, CFunc Function)
				{
						LUA->PushSpecial(GarrysMod::Lua::SPECIAL_GLOB);
						LUA->ReferencePush(Table);
						LUA->PushCFunction(Function);  LUA->SetField(-2, Name);
						return 0;
				}
			};

			namespace hook
			{
				 static int Add(lua_State* state, const char* HookName, const char* ID, CFunc Function)
				{
						GetGlobalField(state, "hook");
						LUA->GetField(-1, "Add");
						LUA->PushString(HookName);
						LUA->PushString(ID);
						LUA->PushCFunction(Function);
						LUA->Call(3, 0);
						LUA->Pop();
						return 0;
				}

				 static int Remove(lua_State* state, const char* HookName, const char* ID)
				{
						GetGlobalField(state, "hook");
						LUA->GetField(-1, "Remove");
						LUA->PushString(HookName);
						LUA->PushString(ID);
						LUA->Call(2, 0);
						LUA->Pop();
						return 0;
				}

			};

			namespace concommand
			{
				static int Add(lua_State* state, const char* Command, CFunc Function)
				{
					GetGlobalField(state, "concommand");
					LUA->GetField(-1, "Add");
					LUA->PushString(Command);
					LUA->PushCFunction(Function);
					LUA->Call(2, 0);
					LUA->Pop();
					return 0;
				}

				static int Remove(lua_State* state, const char* Command)
				{
					GetGlobalField(state, "concommand");
					LUA->GetField(-1, "Remove");
					LUA->PushString(Command);
					LUA->Call(1, 0);
					LUA->Pop();
					return 0;
				}
			};
};