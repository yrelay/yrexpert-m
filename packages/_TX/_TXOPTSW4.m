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

;%TXOPTSW4^INT^1^59547,74032^0
%TXOPTSW4 ;
 
 N NBC,v,i,j,GLO,GSUIV,VAL,VALCON,NBFIX,TAIPAGE,PAGE,S1,S2
 N TEMP,MENG S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"E"),MENG=$$CONCAS^%QZCHAD(TEMP,"MG")
 S STO="STOCON",VAL="VALCON",TAIPAGE=10,NBC=TAIPAGE+2
 S NBC=NBC+1,NBFIX=3 ;;le nom de l'etude est un parametre
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"1")
 S GSUIV=etuatc
 S PAGE=1,PAGEMAX=(PMAX\TAIPAGE)+$S((PMAX#TAIPAGE)=0:0,1:1)
LOOP 
 D INICONF S ABAND="N" D INIT^%TXOPTSW1
 
 
 
 
 
 S J=1 F i=1:1:NBC S VALCON(J)=@GSUIV@(VAR(i)),J=J+1
 
 S S1="S92.15",S2="S92.21"
 S @GLO=CONTRAINTE_" "_S1_" au "_S2_"  ("_PAGE_"/"_PAGEMAX_")"
 D DEF^%TXOPTSW1
 I '($D(STOCON)) S ABAND="O"
 G:'($D(STOCON)) SUITE
 
 S J=1 F i=1:1:NBC S @GSUIV@(VAR(i))=$P(STOCON,$C(0),J),J=J+1
 K STOCON
 
SUITE 
 D CLEBAS^%VVIDEO
 K @(MENG) S @MENG="21^10^79"
 S @MENG@(1)=$$^%QZCHW("+")_"^PLUS",@MENG@(1,"COM")=$$^%QZCHW("page suivante"),@MENG@(2)=$$^%QZCHW("-")_"^MOINS",@MENG@(2,"COM")=$$^%QZCHW("page precedente"),@MENG@(3)=$$^%QZCHW("modifier")_"^MODI",@MENG@(3,"COM")=$$^%QZCHW("modifier les valeurs de cette page"),@MENG@(4)=$$^%QZCHW("fin")_"^END",@MENG@(4,"COM")=$$^%QZCHW("revenir a la description generale")
 S DX=0,DY=22 D CLEBAS^%VVIDEO,LINEUP^%TXOPTETU,^%VQUIKMN(0,80,22,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") END G:ADRES'="" @ADRES G SUITE
PLUS 
 S PAGE=PAGE+1 S:PAGE>PAGEMAX PAGE=1 G LOOP
MOINS 
 S PAGE=PAGE-1 S:PAGE'>0 PAGE=PAGEMAX G LOOP
MODI G LOOP
END 
 
FIN K @(GLO) Q
 
INICONF 
 
 D INIVAR
 Q
INIVAR 
 F i=1:1:3 S v=$P($T(VAR+i),";;",2),v1=$P(v,"~",1),v2=$P(v,"~",2),VAR(i)=v1 S:v2["$$" @("v2="_v2) S:'($D(@GSUIV@(VAR(i)))) @GSUIV@(VAR(i))=v2
 F j=1:1:TAIPAGE S i=3+j,v="Periode ",v1=((PAGE-1)*TAIPAGE)+j,v3=v_v1,VAR(i)=v3 D defaut(v1,i,etuatc,CONTRAINTE)
 Q
defaut(POSIR,POSIPA,G,OBJ) 
 
 
 Q:$D(@GSUIV@(VAR(POSIPA)))
 
 I POSIR=1 S v2=@G@("Valeur Standard"),@G@("Periode "_POSIR)=v2
 I POSIR>1 S v2=@G@("Periode "_(POSIR-1))
 S @GSUIV@(VAR(POSIPA))=v2,@G@("Periode "_POSIR)=v2
 Q
 
etude() Q ETUDE
etude() Q ETUDE
atelier() Q ATELIER
contrainte() Q CONTRAINTE
VAR 
 ;;Etude~$$etude
 ;;Atelier~$$atelier
 ;;Contrainte~$$contrainte

