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

;%AV21C^INT^1^59547,73867^0
%AV21C ;;10:08 AM  18 Oct 1993;
 
 
 
 
 
START(POLON) 
 
 n POLON1
 s POLON1=$$TEMP^%SGUTIL
 
 s p=@POLON,@POLON@(p+1)="",@POLON@(p+1,"VAL")="",@POLON@(p+2)="",@POLON@(p+2,"VAL")=""
 
 
 
 
 
 
 f i=1:1 q:'($d(@POLON@(i)))  d SHOW(i,3) i @POLON@(i)["ATTRIBUT" q:'($d(@POLON@(i+1,"VAL")))  i @POLON@(i+1,"VAL")'="$subex" d INSERSUB("OPERATEUR.UNAIRE","$subex",1) i @POLON@(i+2)'="CODE.EXPRESSION.ANTERIEURE" d INSER0
 
 
 
 s p=@POLON,@POLON@(p+1)="",@POLON@(p+1,"VAL")=""
 f i=1:1 q:'($d(@POLON@(i)))  i @POLON@(i)["ATTRIBUT" q:'($d(@POLON@(i+1,"VAL")))  i @POLON@(i+1,"VAL")'="$indice" d INSERSUB("OPERATEUR.BINAIRE","$indice",101e-2)
 
 s p=@POLON,@POLON@(p+1)="",@POLON@(p+1,"VAL")="",@POLON@(0)="",@POLON@(0,"VAL")=0
 
 
 f j=1:1 q:'($d(@POLON@(j)))  s i=j-1 i @POLON@(j)="CODE.EXPRESSION.ANTERIEURE" q:'($d(@POLON@(j-1,"VAL")))  i @POLON@(j-1,"VAL")'="$subex" d INSERSUB("OPERATEUR.UNAIRE","$subex",1)
 
 
 
 
 s p=@POLON,@POLON@(p+1)="",@POLON@(p+1,"VAL")=""
 s @POLON@(p+2)="",@POLON@(p+2,"VAL")=""
 s @POLON@(p+3)="",@POLON@(p+3,"VAL")=""
 s @POLON@(p+4)="",@POLON@(p+4,"VAL")=""
 s @POLON@(p+5)="",@POLON@(p+5,"VAL")=""
 
 
 f i=1:1 q:'($d(@POLON@(i)))  d SHOW(i,3) i @POLON@(i)["ATTRIBUT",(@POLON@(i+4)'="OPERATEUR.BINAIRE")!(@POLON@(i+4,"VAL")'="^") d deplace(2,i+4,p+4) s @POLON@(i+4)="OPERATEUR.BINAIRE",@POLON@(i+4,"VAL")="^",@POLON@(i+4,"INFO")=198e-2,@POLON@(i+5)="INDIVIDU.SYMBOLIQUE",@POLON@(i+5,"VAL")="%courant",@POLON@(i+5,"INFO")="CANONIQUE",(p,@POLON)=@POLON+2,DELTA=DELTA+1
 
 s p=@POLON,@POLON@(p+1)="",@POLON@(p+1,"VAL")="",@POLON@(p+2)="",@POLON@(p+2,"VAL")=""
 
 f i=1:1 q:'($d(@POLON@(i)))  d SHOW(i,2) i @POLON@(i,"VAL")="^",@POLON@(i+1,"VAL")'="$indeval" d deplace(1,i+1,p+2) s @POLON@(i+1)="OPERATEUR.UNAIRE",@POLON@(i+1,"VAL")="$indeval",@POLON@(i+1,"INFO")=1,(p,@POLON)=@POLON+1,DELTA=DELTA+1
 
 d COPY^%QCAGLC(POLON,POLON1)
 f j=1:1:@POLON s @POLON1@(j)=@POLON@(j)
 f j=1:1:@POLON i @POLON1@(j,"VAL")="^" d INVERCHAP(j)
 d OPERATEURS
 d RECONSTIT
 s expr=CHAINE
 
 
 k @(POLON1)
 q
 
 
deplace(n,l,j) 
 n ii
 
 
 
 f iii=1:1:n d depl
 q
depl 
 f ii=j:-1:l s:$d(@POLON@(ii)) @POLON@(ii+1)=@POLON@(ii) s:$d(@POLON@(ii,"VAL")) @POLON@(ii+1,"VAL")=@POLON@(ii,"VAL") s:$d(@POLON@(ii,"INFO")) @POLON@(ii+1,"INFO")=@POLON@(ii,"INFO")
 q
 
 q
 
 
INSERSUB(c1,c2,c3) 
 d deplace(1,i+1,p+1) s @POLON@(i+1)=c1,@POLON@(i+1,"VAL")=c2,@POLON@(i+1,"INFO")=c3,(p,@POLON)=@POLON+1,DELTA=DELTA+1
 q
INSER0 
 d deplace(1,i+2,p+1) s @POLON@(i+2)="CODE.EXPRESSION.ANTERIEURE",@POLON@(i+2,"VAL")="|0|",@POLON@(i+2,"INFO")=1,(p,@POLON)=@POLON+1,DELTA=DELTA+1
 q
RECONSTIT 
 n i,c,j s c=""
 s j=@POLON
 f i=1:1:p s:$d(@POLON@(i,"VAL")) c=c_@POLON@(i,"VAL")
 s CHAINE=c,expres=c
 q
SHOW(i,j) 
 q
 n ii
 w !," >>> S H O W  chaine ",CHAINE,!,!," >>> "
 s p=@POLON
 f ii=i:1:j w !,?3,i,?5,@POLON@(ii),?35,@POLON@(ii,"VAL")," ","SHOW"
 q
INVERCHAP(j) 
 d COPY(j,6,1),COPY(j,7,2),COPY(j,5,3),COPY(j,1,4),COPY(j,2,5),COPY(j,3,6),COPY(j,4,7)
 q
COPY(posi,j,i) 
 s @POLON@((i+posi)-5)=@POLON1@((j+posi)-5)
 i $d(@POLON@((j+posi)-5,"VAL")) s @POLON@((i+posi)-5,"VAL")=@POLON1@((j+posi)-5,"VAL")
 i $d(@POLON@((j+posi)-5,"INFO")) s @POLON@((i+posi)-5,"INFO")=@POLON1@((j+posi)-5,"INFO")
 q
OPERATEURS 
 q

