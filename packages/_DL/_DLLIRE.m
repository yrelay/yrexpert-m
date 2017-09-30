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

;%DLLIRE^INT^1^59547,73868^0
JLLIRE ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LIRE(COMPO,IDOD,IDOF,QUANT,MACH,DFAB,REGIMAC,OP,ER,GLRES) 
 
 
 N I,ID,ARTICLE,COMPOSANT,OPERATION,JAL,OFFSET,M,TEMP,LOP,TYPE,OR,ROR
 N EROP,REPGAM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIRE") K @(TEMP)
 S LOP=$$CONCAS^%QZCHAD(TEMP,"LOP")
 S ER=0,REPGAM=$$GAMME^%DLCON2
 
 D MVG^%QSCALVA(REPGAM,COMPO,$$GO^%DLCON2,LOP,.TYPE)
 I @LOP=0 S ER=2 K @(TEMP) Q
 
 S OR=IDOD
 S ROR=$$OP^%DLCON2
 S:IDOD'="" OR=$ZP(@LOP@(IDOD))
 F I=1:1 S OR=$O(@LOP@(OR)) Q:(OR="")!(ER'=0)  D STO2 Q:OR=IDOF
 K @(TEMP)
 Q
 
STO2 S OPERATION=@LOP@(OR)
 S @OP@(I)=OPERATION
 S @OP@(I,1)=OR
 S EROP=0
 S M=$$^%QSCALVA(ROR,COMPO_","_OPERATION,MACH)
 I M="" D INSERR2^%DLUTIL(" "_$$ROP^%DLCON2_" "_COMPO_","_OPERATION_" "_$$^%QZCHW("non prise en compte"),3,GLRES) S EROP=1 G STO3
 I '($D(@REGIMAC@(M))) S @REGIMAC@(M)=$$REGIME^%DLREGIM(M) I @REGIMAC@(M)="" S @REGIMAC@(M)=$$REGSTAND^%QMDRUTI D INSERR2^%DLUTIL(" "_$$^%QZCHW("Machine")_" "_M,6,GLRES)
 S @OP@(I,0)=M,ER=0
STO3 S M=$$^%QSCALVA(ROR,COMPO_","_OPERATION,DFAB)
 I M'="" S @OP@(I,2)=QUANT*M G FSTO
 
 D:CAPLIM INSERR2^%DLUTIL(" "_$$ROP^%DLCON2_" "_COMPO_","_OPERATION,4,GLRES)
 S @OP@(I,2)=0
 
FSTO I EROP K @OP@(I) S I=I-1
 Q
 
STOC(OBJ,REGIME,GLRES,OP,I) 
 N M
 S @OP@(I)=$$RART^%DLCON2_" "_OBJ
 S M="//ARTICLE"_OBJ_"//"
 S @OP@(I,1)=M
 I REGIME="" S REGIME=$$REGSTAND^%QMDRUTI D INSERR2^%DLUTIL(" "_$$RART^%DLCON2_" "_OBJ,6,GLRES)
 S @REGIMAC@(M)=REGIME
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
DATFIXE(REPLAN,LANC,DATFIX) 
 N TYP,GLO
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DATE.FIXE")
 K @(GLO),@(DATFIX)
 D MVG^%QSCALVA(REPLAN,LAN,$$DATEFIX^%DLCON2,GLO,.TYP)
 Q:'($D(@GLO))
 S I=""
BDATF S I=$O(@GLO@(I))
 G:I="" DATFIF
 S @DATFIX@(I)=$P(@GLO@(I),",")
 G BDATF
 
DATFIF K @(GLO)
 Q

