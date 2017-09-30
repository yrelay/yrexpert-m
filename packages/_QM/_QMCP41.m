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

;%QMCP41^INT^1^59547,73876^0
QMCP41 ;
 
VERIF2(STO,ERR) 
 N P1,P2,A,WHOIS1,QUI1,QUI2,REP1,REP2,I,LIEN1,LIEN2,TYPE1,TYPE2,BASE1
 N BASE2,OK,LISTA1,LISTA1AD,WHEX
 
 
 S OK=1,WHEX=1
 S WHOIS1=$O(@STO@("SERVICE",""))
 I WHOIS1="" S WHOIS1=WHOIS,WHEX=0
 I $O(@STO@("SERVICE",WHOIS1))'="" D PRINT^%QMCP4(ERR,$$^%QZCHW("vous ne pouvez pas avoir deux services sources"),"") Q 0
 S WHOIS2=$O(@STO@("SERVICE",WHOIS1,""))
 I WHOIS2'="",$O(@STO@("SERVICE",WHOIS1,WHOIS2))'="" D PRINT^%QMCP4(ERR,$$^%QZCHW("vous ne pouvez pas avoir deux services destination"),"") Q 0
 I WHOIS2="" S WHOIS2=WHOIS
 S QUI1=$$TABIDI^%INCOIN(WHOIS1,"MACHINE")
 I QUI1="" D PRINT^%QMCP4(ERR,$$^%QZCHW("la partition de donnees de l'utilisateur")_" "_WHOIS1_" "_$$^%QZCHW("n'est pas definie ou")_" "_$$^%QZCHW("l'utilisateur")_" "_WHOIS1_" "_$$^%QZCHW("n'est pas defini"),"") Q 0
 S QUI2=$$TABIDI^%INCOIN(WHOIS2,"MACHINE")
 I QUI2="" D PRINT^%QMCP4(ERR,$$^%QZCHW("la partition de donnees de l'utilisateur")_" "_WHOIS2_" "_$$^%QZCHW("n'est pas definie ou")_" "_$$^%QZCHW("l'utilisateur")_" "_WHOIS2_" "_$$^%QZCHW("n'est pas defini"),"") Q 0
 
 
 S @STRUCT@("WHOIS1")=WHOIS1
 S @STRUCT@("WHOIS2")=WHOIS2
 
 
 S @STRUCT@("QUI",QUI1)=QUI2
 
 S REP1=$O(@STO@("REPERTOIRE",""))
 I REP1="" D PRINT^%QMCP4(ERR,$$^%QZCHW("vous devez avoir au moins un repertoire de base"),"") Q 0
 I $O(@STO@("REPERTOIRE",REP1))'="" D PRINT^%QMCP4(ERR,$$^%QZCHW("vous ne pouvez pas avoir deux repertoires de base"),"") Q 0
 S REP2=$O(@STO@("REPERTOIRE",REP1,""))
 I REP2'="",$O(@STO@("REPERTOIRE",REP1,REP2))'="" D PRINT^%QMCP4(ERR,$$^%QZCHW("vous ne pouvez pas avoir deux repertoires destination"),"") Q 0
 I REP2="" S REP2=REP1
 I $$NOMINT^%QMCPZ(WHOIS1,QUI1,REP1)="" D PRINT^%QMCP4(ERR,REP1_" "_$$^%QZCHW("n'est pas un nom de repertoire pour l'utilisateur")_" "_WHOIS1,"") S OK=0
 I (REP2'=REP1)!(QUI1'=QUI2),$$NOMINT^%QMCPZ(WHOIS2,QUI2,REP2) D PRINT^%QMCP4(ERR,REP2_" "_$$^%QZCHW("n'est pas un nom de repertoire pour l'utilisateur")_" "_WHOIS2,"") S OK=0
 S BASE1=$$NOMINT^%QMCPZ(WHOIS1,QUI1,REP1)
 I BASE1'="" S @STRUCT@("BS")=BASE1,@STRUCT@("S",BASE1,"BDI")=$$NOMINT^%QMCPZ(WHOIS2,QUI2,REP2)
 
 
 
 
 
 S LIEN1=""
 F I=0:0 S LIEN1=$O(@STO@("LIEN",LIEN1)) Q:LIEN1=""  D VERIF3
 
 S REP1=""
 F I=0:0 S REP1=$O(@STO@("LISTE.D.ATTRIBUTS",REP1)) Q:REP1=""  D VERIF5
 
 S @STRUCT@("VERIFICATION")=1
 S @STRUCT@("DESTRUCTION")=1
 F I="VERIFICATION","DESTRUCTION" I $D(@STO@(I)),@STO@(I)="NON" S @STRUCT@(I)=0
 
 D MORESTR^%QMCPZ1(WHOIS1,QUI1,STRUCT)
 Q OK
VERIF3 N RS1,RD1,RS2,RD2,QUL1
 I '($$EXILIEN^%QMCPZ(WHOIS1,QUI1,LIEN1)) D PRINT^%QMCP4(ERR,LIEN1_" "_$$^%QZCHW("n'est pas un nom de lien pour l'utilisateur")_" "_WHOIS1,"") S OK=0 Q
 S LIEN2=$O(@STO@("LIEN",LIEN1,""))
 I $O(@STO@("LIEN",LIEN1,LIEN2))'="" D PRINT^%QMCP4(ERR,$$^%QZCHW("il y a plus d'un lien destination pour le lien")_" "_LIEN1,"") S OK=0
 I (LIEN1'=LIEN2)!(WHOIS1'=WHOIS2),'($$EXILIEN^%QMCPZ(WHOIS2,QUI2,LIEN2)) D PRINT^%QMCP4(ERR,LIEN2_" "_$$^%QZCHW("n'est pas un nom de lien pour l'utilisateur")_" "_WHOIS2,"") S OK=0
 S TYPE1=$$TYPEL^%QMCPZ(WHOIS1,QUI1,LIEN1)
 S TYPE2=$$TYPEL^%QMCPZ(WHOIS2,QUI2,LIEN2)
 I (TYPE1=4)!(TYPE1=5) S TYPE1=3
 I (TYPE2=4)!(TYPE2=5) S TYPE2=3
 I TYPE1'=TYPE2 D PRINT^%QMCP4(ERR,LIEN1_" "_$$^%QZCHW("n'est pas un lien du meme type que")_" "_LIEN2,"") S OK=0 Q
 D LIENR^%QMCPZ(WHOIS1,QUI1,LIEN1,.RS1,.RD1)
 D LIENR^%QMCPZ(WHOIS2,QUI2,LIEN2,.RS2,.RD2)
 S QUL1=$$QUAL^%QMCPZ(WHOIS1,QUI1,RS1,LIEN1)
 I $$QUAL^%QMCPZ(WHOIS2,QUI2,RS2,LIEN2)'=QUL1 D PRINT^%QMCP4(ERR,WHOIS2_" : "_LIEN2_" "_$$^%QZCHW($S(QUL1=1:"n'est pas qualifie",1:"est qualifie")),"") S OK=0 Q
 S @STRUCT@("S",RS1,"R",LIEN1)=LIEN2
 S @STRUCT@("S",RS1,"BDI")=RS2
 S @STO@("REPERTOIRE1",RS1,"BDI",RS2)=""
 I ($O(@STO@("REPERTOIRE1",RS1,"BDI",""))'=RS2)!($O(@STO@("REPERTOIRE1",RS1,"BDI",RS2))'="") D VERIF4(QUI1,RS1,QUI2,RS2)
 S @STRUCT@("S",RD1,"BDI")=RD2
 S @STO@("REPERTOIRE1",RD1,"BDI",RD2)=""
 I ($O(@STO@("REPERTOIRE1",RD1,"BDI",""))'=RD2)!($O(@STO@("REPERTOIRE1",RD1,"BDI",RD2))'="") D VERIF4(QUI1,RD1,QUI2,RD2)
 Q
VERIF4(QUI1,RS1,QUI2,RS2) 
 D PRINT^%QMCP4(ERR,$$^%QZCHW("le repertoire")_" "_$$NOMLOG^%QMCPZ(WHOIS1,QUI1,RS1)_" "_$$^%QZCHW("a plus d'un repertoire destination dont")_" "_$$NOMLOG^%QMCPZ(WHOIS2,QUI2,RS2),"")
 S OK=0
 Q
 
VERIF5 S BASE1=$$NOMINT^%QMCPZ(WHOIS1,QUI1,REP1)
 I BASE1="" D PRINT^%QMCP4(ERR,REP1_" "_$$^%QZCHW("n'est pas un nom de repertoire (liste d'attributs)"),"") Q
 S LISTA1=$O(@STO@("LISTE.D.ATTRIBUTS",REP1,""))
 I $O(@STO@("LISTE.D.ATTRIBUTS",REP1,LISTA1))'="" D PRINT^%QMCP4(ERR,$$^%QZCHW("vous ne pouvez pas avoir deux listes d'attributs pour le repertoire")_" "_REP1,"") S OK=0 Q
 I '($D(@STRUCT@("S",BASE1))) D PRINT^%QMCP4(ERR,REP1_" "_$$^%QZCHW("n'est pas atteint par les liens que vous avez defini"),$$^%QZCHW("liste d'attributs"))
 I '($$EX^%QMCPZ(WHOIS1,QUI1,LISTA1)) D PRINT^%QMCP4(ERR,$$^%QZCHW("la liste d'attributs")_" "_LISTA1_" "_$$^%QZCHW("est inconnue pour l'utilisateur")_" "_WHOIS1,"") Q
 I LISTA1="*" Q
 S LISTA1AD=$$LIST^%QMCPZ(WHOIS1,QUI1,LISTA1)
 I (LISTA1AD="")!(LISTA1AD="*") Q
 I $E(LISTA1AD,1,6)="^[QUI]" S LISTA1AD="^[QUI1]"_$E(LISTA1AD,7,999)
 S @STRUCT@("S",BASE1,"TS")=0
 S @STRUCT@("S",BASE1,"LI")=LISTA1AD
 Q

