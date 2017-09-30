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

;%QSXCA^INT^1^59547,73883^0
QSXCA(OKB,OKA,INTEG,VISU) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,BASES,BASE,I,RESUL,LL,ER,RESLIEN,CARD1,CARD2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S BASES=$$CONCAS^%QZCHAD(TEMP,"BASES")
 
 S RESUL=$$CONCAS^%QZCHAD(INTEG,"RESUL,ATT")
 
 S RESLIEN=$$CONCAS^%QZCHAD(INTEG,"RESUL,LIEN")
 
 S LL=$$CONCAS^%QZCHAD(TEMP,"LL")
 
 S ER=$$CONCAS^%QZCHAD(INTEG,"ER")
 
 K @(TEMP)
 D REPI^%QSGEST9(BASES)
 
 I OKB D B0
 I OKA D A
 Q
 
B0 D LLIENS(LL)
 S BASE=$O(@LL@(""))
 F I=0:0 Q:BASE=""  D V1 S BASE=$O(@LL@(BASE))
 Q
B1 N LIENS,LIEN,J
 D LIEN^%QSGEST9(BASE,.LIENS)
 S LIEN=$O(LIENS(""))
 F J=0:0 Q:LIEN=""  D B2 S LIEN=$O(LIENS(LIEN))
 Q
B2 D ATT^%QSX(RESLIEN,BASE,LIEN)
 I VISU W !,BASE,"  ",LIEN
 I $$EG4(RESLIEN,BASE,LIEN)=1 S @ER@(BASE,"LIEN",LIEN)="" I VISU W " erreur !!!"
 Q
 
A S BASE=$O(@BASES@(""))
 F I=0:0 Q:BASE=""  D A1 S BASE=$O(@BASES@(BASE))
 Q
A1 N ATTRS,ATT,J
 D RA^%QSGE1(BASE,"ATTRS")
 S ATT=$O(ATTRS(""))
 F J=0:0 Q:ATT=""  D A2 S ATT=$O(ATTRS(ATT))
 Q
A2 D ATT^%QSX(RESUL,BASE,ATT)
 I $$EG4(RESUL,BASE,ATT)=1 S @ER@(BASE,"ATT",ATT)=""
 Q
 
 
EG4(RESUL,BASE,ATT) 
 N CARD,ERR
 S CARD=@RESUL@(BASE,ATT,"CARD","QUERY1"),ERR=0
 F I=2,3 Q:ERR=1  S:CARD'=@RESUL@(BASE,ATT,"CARD","QUERY"_I) ERR=1
 Q ERR
 
VIS(RESUL,BASE1,BASE2,CARD1,CARD2) 
 N LIEN1,LIEN2
 S LIEN1=$$NOMLOG^%QSF(BASE2) I LIEN1="" Q
 S LIEN2=$$NOMLOG^%QSF(BASE1) I LIEN2="" Q
 S CARD1=@RESUL@(BASE1,LIEN2,"CARD","QUERY1")
 S CARD2=@RESUL@(BASE2,LIEN1,"CARD","QUERY1")
 Q CARD1'=CARD2
 
 
LLIENS(LLIEN) 
 N REPS,VU,BASE,BASED,I
 D REPI^%QSGEST9("REPS")
 S BASE=$O(REPS(""))
 F I=0:0 Q:BASE=""  D LL1 S BASE=$O(REPS(BASE))
 Q
LL1 N LIENS,LIEN
 D LIEN^%QSGEST9(BASE,.LIENS)
 S LIEN=$O(LIENS(""))
 F J=0:0 Q:LIEN=""  D LL2 S LIEN=$O(LIENS(LIEN))
 Q
LL2 S BASED=$$NOMINT^%QSF(LIEN) Q:BASED=""
 I $D(VU(BASED,BASE)) Q
 S VU(BASE,BASED)=""
 S @LLIEN@(BASE,LIEN)=""
 Q
 
 
V1 N J,LIEN,BASE1
 S LIEN=$O(@LL@(BASE,""))
 F J=0:0 Q:LIEN=""  D V2 S LIEN=$O(@LL@(BASE,LIEN))
 Q
V2 S BASE1=$$NOMINT^%QSF(LIEN)
 I VISU W !,BASE,"  ",LIEN
 I $$VIS(RESUL,BASE,BASE1,.CARD1,.CARD2)=0 Q
 S @ER@(BASE,"LIEN",LIEN)=BASE_" = "_CARD1_" / "_BASE1_" = "_CARD2 I VISU W " erreur !!!"
 Q
 
TEST K ^%QSXCA
 D ^%QSXCA(1,0,"^%QSXCA",1)
 Q
JTEST X ^BTL
 N STO,A
 S STO="^%QSXCA(WHOIS)"
 K @(STO)
 D DEB^%VTEMPS($P($ZPOS,"^",2))
 D ^%QSXCA(1,0,STO,0)
 S A=$$FIN^%VTEMPS($P($ZPOS,"^",2))
 S @STO@("TEMPS")=A
 Q

