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

;%TLOPTF4^INT^1^59547,74030^0
%TLOPTF4 ;
 
 
 
 
 
 
 
 
 
FORMATNB(IDEB,NBREG) 
 N RES,NBDECIMALE
 I V(IDEB+1)=$C(0) S RES=$$NBCOMPT^%VFORMAT(V(IDEB),"") Q RES
 S RES=$$NBCOMPT^%VFORMAT(V(IDEB),V(IDEB+1))
 Q RES
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EDITLIEN(IDEB,NBREG) 
 N RE,OBB,PGM,NG,PERE,TYPINVO,CONFPRES,GLOCAL,QSDIA,NLI,NIVEDC,DEFETU
 N LOGRE
 S NIVEDC=$$GET^%SGVAR("NIVEDC")+1 D SET^%SGVAR("NIVEDC",NIVEDC)
 S GLOCAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"G"_NIVEDC) K @(GLOCAL)
 S TYPINVO=V(IDEB)
 S RE=V(IDEB+1)
 S (DEFETU,LOGRE)=$$NOMLOG^%QSF(RE)
 S OBB=V(IDEB+2)
 S NLI=V(IDEB+3)
 S DEFETU=DEFETU_$C(0)_$C(0)_NLI_$C(0)_$C(0)_OBB
 S CONFPRES=$S(V(IDEB+4)=$C(0):"STANDARD",1:V(IDEB+4))
 S DEFETU=DEFETU_$C(0)_$C(0)_CONFPRES
 S @GLOCAL@("CONF")=1,@GLOCAL@("CONF","CF")=CONFPRES
 S @GLOCAL@("BASE")=1,@GLOCAL@("BASE","B")=LOGRE
 S @GLOCAL@("BASE","L")=NLI
 S @GLOCAL@("BASE","R",OBB)="",@GLOCAL@("BASE","R")="IND/"_OBB_"/0"
 S @GLOCAL@("DIAL")=1
 
 S QSDIA=""
 G:V(IDEB+5)=$C(0) FINEDI
 S QSDIA=V(IDEB+5)
 I QSDIA'="" S @GLOCAL@("DIAL","R",RE)=QSDIA
 
 
DIA2 S DEFETU=DEFETU_$C(0)_$C(0)_QSDIA
 S QSDIA=""
 G:$$TYPEL^%QSGES90(NLI)'<4 DIA3
 G:V(IDEB+6)=$C(0) FINEDI
 S QSDIA=V(IDEB+6)
 I QSDIA'="" S @GLOCAL@("D","R",$$REPD^%QSGEL2(RE,NLI))=QSDIA
DIA3 S DEFETU=DEFETU_$C(0)_$C(0)_QSDIA
 
 S QSDIA="" G:'($$QUAL^%QSGEL2(RE,NLI)) DIA4 G:V(IDEB+7)=$C(0) FINEDI
 S QSDIA=V(IDEB+7)
 I QSDIA'="" S @GLOCAL@("DIAL","L",NLI)=QSDIA
DIA4 S DEFETU=DEFETU_$C(0)_$C(0)_QSDIA
 
 S QSDIA="" G:'($$QUAL^%QSGEL2($$REPD^%QSGEL2(RE,NLI),$$LIENI^%QSGEL2(RE,$$REPD^%QSGEL2(RE,NLI),NLI,$$TYPEL^%QSGES90(NLI)))) FINEDI
 G:V(IDEB+8)=$C(0) FINEDI
 S QSDIA=V(IDEB+8)
 G:QSDIA="" FINEDI
 S @GLOCAL@("DIAL","L",$$LIENI^%QSGEL2(RE,$$REPD^%QSGEL2(RE,NLI),NLI,$$TYPEL^%QSGES90(NLI)))=QSDIA
FINEDI S DEFETU=DEFETU_$C(0)_$C(0)_QSDIA
 
 K @(GLOCAL)
 D DEP^%SGVAR("NIVEDC")
 D ^%QULELO1("",DEFETU,0)
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TRANSAIS(IDEB,NBREG) 
 N CONT,ACTRT,TRTSA,STO,IMP,GRP
 S TRTSA=""
 
 I V(IDEB+1)=$C(0) S CONT=0 G TRSA1
 S CONT=$S(V(IDEB+1)="O":1,V(IDEB+1)="N":0)
 
TRSA1 I V(IDEB+2)=$C(0) S ACTRT=0 G TRSA2
 S ACTRT=$S(V(IDEB+2)="O":1,V(IDEB+2)="N":0)
 G:'(ACTRT) TRSA2
 
 I V(IDEB+3)'=$C(0) S TRTSA=V(IDEB+3)
 
TRSA2 I V(IDEB+4)=$C(0) S STO=0 G TRSA3
 S STO=$S(V(IDEB+4)="O":1,V(IDEB)="N":0)
 
TRSA3 I V(IDEB+5)=$C(0) S IMP=0 G TRAC
 S IMP=$S(V(IDEB+5)="O":1,V(IDEB+5)="N":0)
 
TRAC D EXTERNE^%SRBATCH(V(IDEB),CONT,STO,ACTRT,TRTSA,.GRP)
 D:IMP ^%SRTRIMP(SAI,GRP)
 Q 1
 ;
 ;
 ;

