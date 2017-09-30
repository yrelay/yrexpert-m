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

;%AV21^INT^1^59547,73867^0
%AV21 ;;04:47 PM  30 Sep 1993
 
 
 
 
 
START 
 
 
 
 
 S p=polon,polon(p+1)="",polon(p+1,"VAL")="",polon(p+2)="",polon(p+2,"VAL")=""
 
 F i=1:1 Q:'($D(polon(i)))  D SHOW(i,3) I polon(i)["ATTRIBUT" Q:'($D(polon(i+1,"VAL")))  I polon(i+1,"VAL")'="$subex" D INSERSUB("OPERATEUR.UNAIRE","$subex",1) I polon(i+2)'="CODE.EXPRESSION.ANTERIEURE" D INSER0
 D RECONSTIT
 
 S p=polon,polon(p+1)="",polon(p+1,"VAL")=""
 
 
 F i=1:1 Q:'($D(polon(i)))  I polon(i)["ATTRIBUT" Q:'($D(polon(i+1,"VAL")))  I polon(i+1,"VAL")'="$indice" D INSERSUB("OPERATEUR.BINAIRE","$indice",101E-2)
 D RECONSTIT
 
 S p=polon,polon(p+1)="",polon(p+1,"VAL")="",polon(0)="",polon(0,"VAL")=0
 
 F j=1:1 Q:'($D(polon(j)))  S i=j-1 I polon(j)="CODE.EXPRESSION.ANTERIEURE" Q:'($D(polon(j-1,"VAL")))  I polon(j-1,"VAL")'="$subex" D INSERSUB("OPERATEUR.UNAIRE","$subex",1)
 
 D RECONSTIT
 
 S p=polon,polon(p+1)="",polon(p+1,"VAL")=""
 S polon(p+2)="",polon(p+2,"VAL")=""
 S polon(p+3)="",polon(p+3,"VAL")=""
 S polon(p+4)="",polon(p+4,"VAL")=""
 S polon(p+5)="",polon(p+5,"VAL")=""
 
 
 F i=1:1 Q:'($D(polon(i)))  D SHOW(i,3) I polon(i)["ATTRIBUT",(polon(i+4)'="OPERATEUR.BINAIRE")!(polon(i+4,"VAL")'="^") D deplace(2,i+4,p+4) S polon(i+4)="OPERATEUR.BINAIRE",polon(i+4,"VAL")="^",polon(i+4,"INFO")=198E-2,polon(i+5)="INDIVIDU.SYMBOLIQUE",polon(i+5,"VAL")="%courant",polon(i+5,"INFO")="CANONIQUE",(p,polon)=polon+2,DELTA=DELTA+1
 
 D RECONSTIT
 
 S p=polon,polon(p+1)="",polon(p+1,"VAL")="",polon(p+2)="",polon(p+2,"VAL")=""
 
 
 F i=1:1 Q:'($D(polon(i)))  D SHOW(i,2) I polon(i,"VAL")="^",polon(i+1,"VAL")'="$indeval" D deplace(1,i+1,p+2) S polon(i+1)="OPERATEUR.UNAIRE",polon(i+1,"VAL")="$indeval",polon(i+1,"INFO")=1,(p,polon)=polon+1,DELTA=DELTA+1
 
 D RECONSTIT
 
 D COPY^%QCAGLC("polon","polon1")
 F j=1:1:polon S polon1(j)=polon(j)
 F j=1:1:polon I polon1(j,"VAL")="^" D INVERCHAP(j)
 D OPERATEURS,RECONSTIT
 S expr=CHAINE K polon1
 
 
 
 ;; fin de la normalisation
POLONAIS 
 ;; debut de l'ecriture en polonaise
 S p=polon,i=1,ipol=0,LASTOPEMPIL="",TAB="^PILEPOL($j)"
 S POLO=STOCK
 K @(TAB),@(POLO) S @TAB=0,@POLO=0,TYPEOP="",VALOP="",INFO=""
LOOPOL G:i>p FINPOL S TYPEITEM=polon(i) G:TYPEITEM="" kick S VALITEM=polon(i,"VAL"),INFOTEM=polon(i,"INFO")
 I TYPEITEM["ATTRIBUT" D PUSH^%AMRANAR(POLO,TYPEITEM,VALITEM,INFOTEM) G kick
 I TYPEITEM="INDIVIDU.SYMBOLIQUE" D PUSH^%AMRANAR(POLO,TYPEITEM,VALITEM,INFOTEM) G kick
 I TYPEITEM="CODE.EXPRESSION.ANTERIEURE" D PUSH^%AMRANAR(POLO,TYPEITEM,VALITEM,INFOTEM) G kick
LOOPOP 
 
 
 
 
loop2 D PULL^%AVXR(TAB,.TYPEOP,.VALOP,.INFO)
 I INFO'="",INFOTEM'<INFO D PUSH^%AMRANAR(POLO,TYPEOP,VALOP,INFO) G loop2
 I INFO'="" D PUSH^%AVXR(TAB,TYPEOP,VALOP,INFO)
 D PUSH^%AVXR(TAB,TYPEITEM,VALITEM,INFOTEM) G kick
kick S i=i+1 G LOOPOL
FINPOL 
 D PULL^%AVXR(TAB,.TYPEOP,.VALOP,.INFO) I TYPEOP'="" D PUSH^%AMRANAR(POLO,TYPEOP,VALOP,INFO) G FINPOL
 
 D see^%AVXR(POLO)
 Q
 
 
deplace(n,l,j) 
 N ii
 
 
 
 F iii=1:1:n D depl
 Q
depl 
 F ii=j:-1:l S:$D(polon(ii)) polon(ii+1)=polon(ii) S:$D(polon(ii,"VAL")) polon(ii+1,"VAL")=polon(ii,"VAL") S:$D(polon(ii,"INFO")) polon(ii+1,"INFO")=polon(ii,"INFO")
 Q
 
 Q
INSERSUB(c1,c2,c3) 
 D deplace(1,i+1,p+1) S polon(i+1)=c1,polon(i+1,"VAL")=c2,polon(i+1,"INFO")=c3,(p,polon)=polon+1,DELTA=DELTA+1
 Q
INSER0 
 D deplace(1,i+2,p+1) S polon(i+2)="CODE.EXPRESSION.ANTERIEURE",polon(i+2,"VAL")="|0|",polon(i+2,"INFO")=1,(p,polon)=polon+1,DELTA=DELTA+1
 Q
RECONSTIT 
 N i,c,j S c=""
 S j=polon
 F i=1:1:p S:$D(polon(i,"VAL")) c=c_polon(i,"VAL")
 S CHAINE=c,expres=c
 Q
SHOW(i,j) 
 Q
 N ii
 W !," >>> S H O W  chaine ",CHAINE,!,!," >>> "
 S p=polon
 F ii=i:1:j W !,?3,i,?5,polon(ii),?35,polon(ii,"VAL")," ","SHOW"
 Q
INVERCHAP(j) 
 D COPY(j,6,1),COPY(j,7,2),COPY(j,5,3),COPY(j,1,4),COPY(j,2,5),COPY(j,3,6),COPY(j,4,7)
 Q
COPY(posi,j,i) 
 S polon((i+posi)-5)=polon1((j+posi)-5)
 I $D(polon((j+posi)-5,"VAL")) S polon((i+posi)-5,"VAL")=polon1((j+posi)-5,"VAL")
 I $D(polon((j+posi)-5,"INFO")) S polon((i+posi)-5,"INFO")=polon1((j+posi)-5,"INFO")
 Q
OPERATEURS 
 Q

