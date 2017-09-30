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

;%SYSINST^INT^1^59547,73892^0
%ZINSTALL(LDO) 
 
 
 
 
 
 
 
 
 
 N BLK,C,CUR,D,%D,%DIR,DM,DO,END,GLO,I,LD,PDP,PROG D INT^%DIR
 W !,"Initialisation des droits d'acces aux globals",!
L0 W !,"La machine est-elle un (M)icro-Vax ou un (P)dp 11 ? : "
 R *C F I=77,80 G:I=C @I
 D ^%VSQUEAK G L0
77 S PDP=0,PROG="MVX",DM="DUB1:[MVX]" G SUIT
80 S PDP=1,PROG="PDP",DM="MG" G SUIT
SUIT D GO(DM) W !,"Directory utilisateur a controler : " R Y1 G:Y1="" GOGO I '($D(^%SYS("UCI",Y1))) W *7," inconnue ..." G SUIT
 S LD(Y1)="" G SUIT
GOGO S DO=-1 F %D=0:0 S DO=$N(LDO(DO)) Q:DO=-1  D TDO
 D GO(%DIR) W !,"Termine",! Q
 Q
TDO W !,"Domaine : ",DO
 S D=-1 F %D=0:0 S D=$N(LD(D)) Q:D=-1  D TD
 Q
TD W !,"  Directory : ",D
 S GLO="" F %G=0:0 S GLO=$O(^[%DIR]TOLISGLO(DO,GLO)) Q:GLO=""  S @("^[D]"_GLO_"(""z"")=""""")
 D GO(D) S PRO=255
 O 63 W *
 C 63 D GO(DM) Q
NXTBLK W *
A S STR="" I CUR'<END S BLK=$V(2040,0,3) G NOTFOUND:'(BLK),NXTBLK
B W *
 G FOUND:STR=GLO
 S CUR=CUR+9 G A
NOTFOUND W !,GLO," *** pas trouve ***" Q
FOUND V (CUR+2)+PDP:0:1:PRO
 W *
 W !,GLO," [ok]"
 Q
MVX(D) W *
PDP(D) N A W *
GO(D) D @(PROG_"("""_D_""")") Q

