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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QWACR4^INT^1^59547,73886^0
%QWACR4(REP,IND,NR,DOM) 
 
 
 
 
 
 
 
 N GCOMP,NUMCD,ERR,NOUV,NUMAC,ACRES,NUML,RDEST,DEST,VAL
 S GCOMP=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""C4"")",DOM)
 S GCOMP=$$CONCAS^%QZCHAD(GCOMP,NR)
 
 S NOUV=1
 I $D(@GCOMP@("P"))<10 G G1
 S NUMCD=""
F10 S NUMCD=$O(@GCOMP@("P",NUMCD))
 Q:NUMCD="" 0
 S $ZT="G F25^%QWACR4"
F20 I @(@GCOMP@("P",NUMCD,"E"))  S $ZT="" G G1
 S $ZT="" G F10
F25 S ERR=$ZE,$ZT=""
 G:$E(ERR,1,6)="<UNDEF" F10 G F20
 
 
G1 
 S LIEN=@GCOMP@("L")
 S $ZT="G G1ER^%QWACR4",$ZE=""
G1AG S @("DEST="_@GCOMP@("I","E"))
G1ER S ERR=$ZE,$ZT="",$ZE=""
 Q:$E(ERR,1,6)="<UNDEF" 0 G:ERR'="" G1AG
 S RDEST=@WWLSTOCK@(LIEN,"D")
 
 
 
 I '($D(@GCOMP@("O","E"))) S ORD=DEST G CREAT
 S $ZT="G K25^%QWACR4",ERR=""
K12 S @("ORD="_@GCOMP@("O","E"))
 G CREAT
K25 S ERR=$ZE,$ZT="" G:$E(ERR,1,6)="<UNDEF" I1 G K12
 
 
 
 
CREAT 
 Q:'($$OKLINK^%QWSTOI(REP,IND,LIEN,ORD,DEST,IND)) 0
 D AJOUTER^%QWSTOI("EXEC",RDEST,DEST,4,NR,"NOUV")
 S NUML=$$LINK^%QWSTOI("EXEC",REP,IND,LIEN,ORD,DEST,IND,4,NR,"NOUV")
 
 
 
H1 S NUMAC=""
H10 S NUMAC=$O(@GCOMP@("R",NUMAC)) G:NUMAC="" I1
 S ACRES=$O(@GCOMP@("R",NUMAC,""))
 S $ZT="G H25^%QWACR4"
H20 S @("VAL="_@GCOMP@("R",NUMAC,ACRES,"E"))
H25 S ERR=$ZE,$ZT="",$ZE="" G:$E(ERR,1,6)="<UNDEF" H10 G:ERR'="" H20
 I $$AFFECT^%QWSTOE(4,NR,NOUV,$$ONE^%QSGEL3("LIEN"),NUML,ACRES,1,VAL) S NOUV=0
 G H10
 
 
 
I1 S NUMAC=""
I10 S NUMAC=$O(@GCOMP@("RL",NUMAC)) G:NUMAC="" FIN
 S ACRES=$O(@GCOMP@("RL",NUMAC,""))
 S $ZT="G I25^%QWACR4"
I20 S @("VAL="_@GCOMP@("RL",NUMAC,ACRES,"E"))
I25 S ERR=$ZE,$ZT="",$ZE="" G:$E(ERR,1,6)="<UNDEF" H10 G:ERR'="" I20
 I $$AFFECT^%QWSTOE(4,NR,NOUV,RDEST,DEST,ACRES,1,VAL) S NOUV=0
 G I10
 
FIN 
 Q 1-NOUV

