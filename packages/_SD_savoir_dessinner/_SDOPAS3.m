;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SDOPAS3^INT^1^59547,73889^0
SDOPAS3 ;
 
 
 
 
 
 
 
 
6 
 
 S X1=$P(ELEM,"^",2),Y1=$P(ELEM,"^",3),R=$P(ELEM,"^",4),SYNT=$P(ELEM,"^",13),SYNT=$E(SYNT,2,$L(SYNT)-1)
 S TL=$$TL($P(ELEM,"^",7))
 S ID=$P(ELEM,"^",5),IF=$P(ELEM,"^",6)
 
 I $L(SYNT,";")>1 G 61
60 
 
 S X3=$P(ELEM,"^",2),Y3=$P(ELEM,"^",3)
 
 
 S X1=$J((R*$$COS^%PBCACV(ID))+X3,1,0)
 S Y1=$J((R*$$SIN^%PBCACV(ID))+Y3,1,0)
 
 S X2=$J((R*$$COS^%PBCACV(IF))+X3,1,0)
 S Y2=$J((R*$$SIN^%PBCACV(IF))+Y3,1,0)
 S @GLTEXT@(EL)=EL_" ; ARC ; 1 ; "_TL_" ; 1 ; ( "_$$T(X3)_" ; "_$$T(Y3)_" ) ; ( "_$$T(X1)_" ; "_$$T(Y1)_" ) ; ( "_$$T(X2)_" ; "_$$T(Y2)_" )"
 G 69
61 
 S LG=$P(SYNT,"/") I LG'=0 G 62
 
 S PD=$P(SYNT,";"),PA=$P(SYNT,";",2),PC=$P(SYNT,";",3)
 
 S X2=$P(@REFPT@(PA),"^"),Y2=$P(@REFPT@(PA),"^",2)
 S X3=$P(@REFPT@(PC),"^"),Y3=$P(@REFPT@(PC),"^",2)
 
 S PD=@POINT@(PD),PA=@POINT@(PA),PC=@POINT@(PC)
 S @GLTEXT@(EL)=EL_" ; ARC ; 1 ; "_TL_" ; 2 ; "_PD_" ; "_PA_" ; "_PC
 G 69
62 
 S LG=$P(SYNT,"/") I LG=0 D ^%VZEAVT("ERREUR no "_EL) Q
 I $P(SYNT,"/",2)["R=" G 63
 G 60
 
 S PC=$P(SYNT,";"),PD=$P($P(SYNT,"/"),";",2),PA=$P(SYNT,";",3),A=$P($P(SYNT,"=",2),";")
 G 64
 S @GLTEXT@(EL)=EL_" ; ARC ; 1 ; "_TL_" ; 1 ; "_PC_" ; "_PD_" ; "_A
63 
 S PD=$P(SYNT,";"),PA=$P($P(SYNT,"/"),";",2),PC=$P(SYNT,";",3),R=$P($P(SYNT,"=",2),";")
 S @GLTEXT@(EL)=EL_" ; ARC ; 1 ; "_TL_" ; 2 ; "_PD_" ; "_ID_" ; "_IF_" ; "_$$T(R)
64 
 S X1=$P(@REFPT@(PD),"^"),Y1=$P(@REFPT@(PD),"^",2)
 S X2=$P(@REFPT@(PA),"^"),Y2=$P(@REFPT@(PA),"^",2)
 S X3=$P(@REFPT@(PC),"^"),Y3=$P(@REFPT@(PC),"^",2)
 
69 S @GLOBJ@("EL",EL,"TYPE")="ARC"
 S @GLOBJ@("EL",EL,"PRES")="6^"_X1_"^"_Y1_"^"_X2_"^"_Y2_"^"_X3_"^"_Y3_"^"_TL
 D ANA^%SDOPAS3(EL,TYPE)
 Q
 
7 
 
 S X1=$P(ELEM,"^",2),Y1=$P(ELEM,"^",3),R=$P(ELEM,"^",4),SYNT=$P(ELEM,"^",9),SYNT=$E(SYNT,2,$L(SYNT)-1)
 S TL=$$TL($P(ELEM,"^",5))
 
 I $L(SYNT,";")>1 G 71
 
 S X2=X1+R,Y2=Y1
 S @GLTEXT@(EL)=EL_" ; CERCLE ; 1 ; "_TL_" ; 1 ; ( "_$$T(X1)_" ; "_$$T(Y1)_" ) ; ( "_$$T(X2)_" ; "_$$T(Y2)_" )"
 G 79
71 
 S LG=$L(SYNT,"/") I LG>1 G 72
 
 S PD=$P(SYNT,";"),PA=$P(SYNT,";",2)
 
 S X2=$P(@REFPT@(PA),"^",1),Y2=$P(@REFPT@(PA),"^",2)
 
 S PD=@POINT@(PD),PA=@POINT@(PA)
 S @GLTEXT@(EL)=EL_" ; CERCLE ; 1 ; "_TL_" ; 1 ; "_PD_" ; "_PA
 G 79
72 
 S X2=X1+R,Y2=Y1
 S PD=$P(SYNT,"/"),R=$P(SYNT,"/",2)
 S @GLTEXT@(EL)=EL_" ; CERCLE ; 1 ; "_TL_" ; 2 ; "_PD_" ; "_$$T(R)
 
79 S @GLOBJ@("EL",EL,"PRES")="7^"_X1_"^"_Y1_"^"_X2_"^"_Y2_"^"_$P(ELEM,"^",5)
 S @GLOBJ@("EL",EL,"TYPE")="CERCLE"
 D ANA^%SDOPAS3(EL,TYPE)
 Q
 
T(XX) 
 Q $J(XX/188E-1,1,1)
 
TL(TL) 
 Q """"_$S(TL="M":"MIXTE",TL="C":"COURT",TL="L":"LONG",TL="I":"INVISIBLE",1:"NORMAL")_""""
 Q
 
 
ANA(NEWEL,TYPE) 
 D MSG^%VZEATT("analyse de l'element no "_NEWEL_" ---> "_TYPE)
 N REFPT,RES,NOM,MERR,ANCNOM,PRES S ANCNOM=""
 
 S PRES=@GLOBJ@("EL",NEWEL,"PRES")
 
 S COND=$$CONDI^%SDEGES3(NEWEL)
 
 S OK=$$LIGNE^%SDEANT1(@GLTEXT@(NEWEL),0,0,NEWEL,0,1,.NOM,.RES,.MERR)
 S @GLOBJ@("EL",NEWEL,"PRES")=PRES
 I MERR="" Q
 D ^%VZEAVT(MERR)
 Q

